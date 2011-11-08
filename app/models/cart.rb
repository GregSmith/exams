class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
      current_item.price = current_item.product.price
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  def total_items
    line_items.sum(:quantity)
  end
  
  def paypal_encrypted(return_url, notify_url)
    values = {
      business: 'seller_1318460388_biz@alpha-score.com',
      cmd: '_cart',
      upload: 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url,
      :cert_id => "U4DDMNCK5BQP4"
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.price,
        "item_name_#{index+1}" => item.product.title,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    encrypt_for_paypal(values)
  end
  
  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end
end