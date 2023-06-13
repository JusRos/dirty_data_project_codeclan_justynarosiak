
## libraries I am likely to need

library(tidyverse)
library(skimr)
library(janitor)
library(here)
library(readxl)

## 1.read in data
# 1.1
candy_2015 <- read_xlsx("../task4/raw_data/boing-boing-candy-2015.xlsx")

# 1.2
candy_2016 <- read_xlsx("raw_data/boing-boing-candy-2016.xlsx")

# 1.3
candy_2017 <- read_xlsx("raw_data/boing-boing-candy-2017.xlsx")

## 2. General exploration of a data set for each year

# 2.1 
skim(candy_2015)
colnames(candy_2015)
view(candy_2015)
dim(candy_2015)
skim(candy_2015)

# 2.2
skim(candy_2016)
colnames(candy_2016)
view(candy_2016)
dim(candy_2016)
skim(candy_2016)

# 2.3
skim(candy_2017)
colnames(candy_2017)
view(candy_2017)
dim(candy_2017)
skim(candy_2017)

## 3. Clean names

# 3.1
candy_2015 <- clean_names(candy_2015)

# 3.2
candy_2016 <- clean_names(candy_2016) 

# 3.3
candy_2017 <- clean_names(candy_2017) 

# 3.3.1 


## 4.splitting time stamp column into 'year' and 'the rest'
# 4.1
candy_2015 <- candy_2015 %>% 
  separate(timestamp,c("year", "the_rest"), sep = "-" )
# 4.2
candy_2016 <- candy_2016 %>% 
  separate(timestamp,c("year", "the_rest"), sep = "-" )
# 4.3 adding a year column to a data set
candy_2017 <- candy_2017 %>% 
  mutate(year = "2017")
# 4.3.1 remove 'q1:_' from each column name
colnames(candy_2017) = str_remove(names(candy_2017), "^[a-z0-9]+[_]")
# 4.3.2 clean names again
candy_2017 <- clean_names(candy_2017) 


# 5. assign all the columns, I want to drop to an object called 'drop_year'(first identify what columns are removed because they're not considered candy - 'not_candy_year', and the ones that are irrelevant to the analysis - 'irrelevant_col_year')

# 5.1
not_candy_2015 <- c("vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein", "box_o_raisins","generic_brand_acetaminophen", "glow_sticks", "broken_glow_stick","healthy_fruit","hugs_actual_physical_hugs",  "creepy_religious_comics_chick_tracts","kale_smoothie","lapel_pins","minibags_of_chips", "spotted_dick", "peterson_brand_sidewalk_chalk", "peanut_butter_jars", "trail_mix","vicodin", "white_bread", "whole_wheat_anything","cash_or_other_forms_of_legal_tender")

irrelevant_col_2015 <- c("the_rest", "which_state_province_county_do_you_live_in",
               "please_leave_any_remarks_or_comments_regarding_your_choices","please_list_any_items_not_included_above_that_give_you_joy","please_list_any_items_not_included_above_that_give_you_despair","guess_the_number_of_mints_in_my_hand","betty_or_veronica","check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of","that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was","fill_in_the_blank_taylor_swift_is_a_force_for","what_is_your_favourite_font","if_you_squint_really_hard_the_words_intelligent_design_would_look_like","fill_in_the_blank_imitation_is_a_form_of","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626","which_day_do_you_prefer_friday_or_sunday","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles",
"please_leave_any_witty_snarky_or_thoughtful_remarks_or_comments_regarding_your_choices",
"that_dress_that_went_viral_a_few_years_back_when_i_first_saw_it_it_was", "do_you_eat_apples_the_correct_way_east_to_west_side_to_side_or_do_you_eat_them_like_a_freak_of_nature_south_to_north_bottom_to_top","when_you_see_the_above_image_of_the_4_different_websites_which_one_would_you_most_likely_check_out_please_be_honest", "york_peppermint_patties_ignore"
)

drop_2015 <- c(not_candy_2015, irrelevant_col_2015)

# 5.2

not_candy_2016 <- c("boxo_raisins","broken_glow_stick","cash_or_other_forms_of_legal_tender", "chardonnay","creepy_religious_comics_chick_tracts","generic_brand_acetaminophen","glow_sticks", "healthy_fruit","hugs_actual_physical_hugs", "person_of_interest_season_3_dvd_box_set_not_including_disc_4_with_hilarious_outtakes","spotted_dick", "trail_mix","vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein","vicodin", "white_bread","whole_wheat_anything","sandwich_sized_bags_filled_with_boo_berry_crunch","sweet_tarts","real_housewives_of_orange_county_season_9_blue_ray", "minibags_of_chips", "kale_smoothie"
)

irrelevant_col_2016 <- c("the_rest", "which_state_province_county_do_you_live_in", "please_list_any_items_not_included_above_that_give_you_joy",                       "please_list_any_items_not_included_above_that_give_you_despair",   "please_leave_any_witty_snarky_or_thoughtful_remarks_or_comments_regarding_your_choices", "guess_the_number_of_mints_in_my_hand","betty_or_veronica", "that_dress_that_went_viral_a_few_years_back_when_i_first_saw_it_it_was", "what_is_your_favourite_font", "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling",        "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams",         "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce",           "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber",            "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon", "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626", "which_day_do_you_prefer_friday_or_sunday", "do_you_eat_apples_the_correct_way_east_to_west_side_to_side_or_do_you_eat_them_like_a_freak_of_nature_south_to_north_bottom_to_top", "when_you_see_the_above_image_of_the_4_different_websites_which_one_would_you_most_likely_check_out_please_be_honest","york_peppermint_patties_ignore")
                         
drop_2016 <- c(not_candy_2016, irrelevant_col_2016)

# 5.3
not_candy_2017 <- c("boxo_raisins","broken_glow_stick","cash_or_other_forms_of_legal_tender", "chardonnay","creepy_religious_comics_chick_tracts","generic_brand_acetaminophen","glow_sticks", "healthy_fruit","hugs_actual_physical_hugs", "person_of_interest_season_3_dvd_box_set_not_including_disc_4_with_hilarious_outtakes","spotted_dick", "trail_mix","vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein","vicodin", "white_bread","whole_wheat_anything", "bonkers_the_board_game")
  
irrelevant_col_2017 <- c("id","state_province_county_etc","joy_other","despair_other","other_comments","dress","x114","day","media_daily_dish","media_science","media_espn","media_yahoo","coordinates_x_y", "abstained_from_m_ming"
)

drop_2017 <- c(not_candy_2017, irrelevant_col_2017)


## 6. keep only columns that seem to include candies and are relevant to the analysis
# 6.1 
candy_2015 <- candy_2015[,!names(candy_2015) %in% drop_2015]

# 6.2
candy_2016 <- candy_2016[,!names(candy_2016) %in% drop_2016]

# 6.3
candy_2017 <- candy_2017[,!names(candy_2017) %in% drop_2017]



## 7. ensure each data set contains year, age, going_out, country, gender 
# 7.1
view(candy_2015)
candy_2015 <- candy_2015 %>% 
  rename("age" = "how_old_are_you", 
         "going_out" = "are_you_going_actually_going_trick_or_treating_yourself")
# 7.2
view(candy_2016)
candy_2016 <- candy_2016 %>% 
  rename("age" = "how_old_are_you",
         "gender" = "your_gender",
         "going_out" = "are_you_going_actually_going_trick_or_treating_yourself","country" = "which_country_do_you_live_in")
# 7.3 all required columns already there
view(candy_2017)

## 8. join all three data sets into one called 'candies' and explore further.

joined_two <- full_join(candy_2015, candy_2016)
candies <- full_join(joined_two, candy_2017)

view(candies)

glimpse(candies)

## 9. change age column to numeric

candies <- candies %>% 
  mutate(age = as.integer(age))
## tidy up a 'country' column
candies %>% 
  select(country)




