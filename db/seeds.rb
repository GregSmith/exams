# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Product.delete_all
Product.create(:title => 'Actual LSAT 63 - June 2011 Prep Test',
  :description => 
    %{<p>
        <em>Actual LSAT 63 - June 2011 Prep Test</em> includes the complete exam
        and explanations for every question.
      </p>},
  :image_url =>   '/images/lsat_prep_test_63.jpg',    
  :price => 49.95)
# . . .
Product.create(:title => 'Actual LSAT 62 - December 2010 Prep Test',
  :description =>
    %{<p>
        <em>Actual LSAT 62 - December 2010 Prep Test</em> includes the complete exam
        and explanations for every question.
      </p>},
  :image_url => '/images/lsat_prep_test_62.jpg',
  :price => 49.95)
# . . .

Product.create(:title => 'Actual LSAT 61 - October 2010 Prep Test',
  :description => 
    %{<p>
        <em>Actual LSAT 61 - October 2010 Prep Test</em> includes the complete exam
        and explanations for every question.
      </p>},
  :image_url => '/images/lsat_prep_test_61.jpg',
  :price => 49.95)
  
# . . .

Product.create(:title => 'Actual LSAT 60 - June 2010 Prep Test',
  :description => 
    %{<p>
        <em>Actual LSAT 60 - June 2010 Prep Test</em> includes the complete exam
        and explanations for every question.
      </p>},
  :image_url => '/images/lsat_prep_test_60.gif',
  :price => 49.95)

# . . .

Product.create(:title => 'Actual LSAT 59 - December 2009 Prep Test',
  :description => 
    %{<p>
        <em>Actual LSAT 61 - December 2009 Prep Test</em> includes the complete exam
        and explanations for every question.
      </p>},
  :image_url => '/images/lsat_prep_test_59.jpg',
  :price => 49.95)