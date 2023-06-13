# libraries I am likely to need

library(tidyverse)
library(skimr)
library(janitor)
library(here)
library(readxl)

# 1.read in data
candy_2015 <- read_xlsx("../task4/raw_data/boing-boing-candy-2015.xlsx")


# 2. General exploration of a data set.
skim(candy_2015)
colnames(candy_2015)
view(candy_2015)
dim(candy_2015)
skim(candy_2015)

# 3. Clean names
candy_2015 <- clean_names(candy_2015) 

# 4.splitting time stamp column into 'year' and 'the rest'

candy_2015 <- candy_2015 %>% 
separate(timestamp,c("year", "the_rest"), sep = "-" )


# 5. assign all the columns, I want to drop to an object called 'drop'
# 5a identify columns that are not needed for analysis ( columns with random info
# and also those that do not include candy)

drop_2015 <- c("vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein", "box_o_raisins","generic_brand_acetaminophen", "glow_sticks", "broken_glow_stick","healthy_fruit","hugs_actual_physical_hugs",  "creepy_religious_comics_chick_tracts","kale_smoothie","lapel_pins","minibags_of_chips", "spotted_dick", "peterson_brand_sidewalk_chalk", "peanut_butter_jars", "trail_mix","vicodin", "white_bread", "whole_wheat_anything","cash_or_other_forms_of_legal_tender","the_rest", "please_leave_any_remarks_or_comments_regarding_your_choices","please_list_any_items_not_included_above_that_give_you_joy","please_list_any_items_not_included_above_that_give_you_despair","guess_the_number_of_mints_in_my_hand","betty_or_veronica","check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of","that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was","fill_in_the_blank_taylor_swift_is_a_force_for","what_is_your_favourite_font","if_you_squint_really_hard_the_words_intelligent_design_would_look_like","fill_in_the_blank_imitation_is_a_form_of","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626","which_day_do_you_prefer_friday_or_sunday","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles"
)

# 6. keep only columns that seem to include candies and are relevant to the analysis
 candy_2015 <- candy_2015[,!names(candy_2015) %in% drop_2015]


 # 7. write the cleaner file into a csv file called 'candy_2015-basic'.
 write_csv(candy_2015, file = "clean_data/candy_2015_basic")
 

# merging data sets together




