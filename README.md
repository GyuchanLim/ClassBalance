# Description
ClassBalance is an app for sole traders who needs to keep track of their schedule to easily manage clients more effectively.
It's written fully in [Rails](https://rubyonrails.org/) making use of it's easy to use [CRUD](https://guides.rubyonrails.org/active_record_basics.html) actions.

### Get started
This is a simple application, all you need to do after cloning the repo is run the migrations and the seeds to try it out `rails db:drop db:setup`

### Improvements
- Prettify the UI/UX it looks pretty disgusting
- Create a `calendar` page similar to the [dot-grid-calendar](https://basecamp.com/shapeup/1.1-chapter-02#case-study-the-dot-grid-calendar)
- Add [Devise](https://github.com/heartcombo/devise) for **admins** under different **Organizations** so they can manage their clients on a upper level
