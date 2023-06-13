# libraries I am likely to need

library(tidyverse)
library(skimr)
library(janitor)
library(here)
library(readxl)

# 1.read in data
candy_2017 <- read_xlsx("raw_data/boing-boing-candy-2017.xlsx")

# 2. General exploration of a data set.
skim(candy_2016)
colnames(candy_2016)
view(candy_2016)
dim(candy_2016)
skim(candy_2016)

# 3. Clean names
candy_2016 <- clean_names(candy_2016) 

# 4.splitting time stamp column into 'year' and 'the rest'

candy_2016 <- candy_2016 %>% 
  separate(timestamp,c("year", "the_rest"), sep = "-" )


# 5. assign all the columns, I want to drop to an object called 'drop'

drop_2016 <- c("the_rest", "which_state_province_county_do_you_live_in",
               "please_leave_any_remarks_or_comments_regarding_your_choices","please_list_any_items_not_included_above_that_give_you_joy","please_list_any_items_not_included_above_that_give_you_despair","guess_the_number_of_mints_in_my_hand","betty_or_veronica","check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of","that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was","fill_in_the_blank_taylor_swift_is_a_force_for","what_is_your_favourite_font","if_you_squint_really_hard_the_words_intelligent_design_would_look_like","fill_in_the_blank_imitation_is_a_form_of","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon","please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626","which_day_do_you_prefer_friday_or_sunday","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump","please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles",
               "please_leave_any_witty_snarky_or_thoughtful_remarks_or_comments_regarding_your_choices",
               "that_dress_that_went_viral_a_few_years_back_when_i_first_saw_it_it_was" , "do_you_eat_apples_the_correct_way_east_to_west_side_to_side_or_do_you_eat_them_like_a_freak_of_nature_south_to_north_bottom_to_top","when_you_see_the_above_image_of_the_4_different_websites_which_one_would_you_most_likely_check_out_please_be_honest", "york_peppermint_patties_ignore"
)

# 6. keep only relevant columns
candy_2016 <- candy_2016[,!names(candy_2016) %in% drop_2016]


# 7. write_csv(candy_2015, file = "clean_data/candy_2015")
candy_2016 <- write_csv(candy_2016, file = "clean_data//candy_2016_cleaner")