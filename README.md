# [![My Skills](https://skills.thijs.gg/icons?i=ruby&theme=light)](https://skills.thijs.gg) Good Night API

## 🛠️ Requirement : 
1. Git
2. Ruby v3.0.2
3. Gem
4. Bundle
5. Sqlite

## 🌏 Roadmap :
1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records of a user's All friends from the previous week, which are sorted based on the duration of All friends sleep length.

## 📓 User Story
- As a user i can login to system by provide name.
- As a user i can 'Clock in' to record time when i sleep.
- As a user i can 'Clock out' to record time when i wake up.
- As a user i can 'Follow' to another user.
- As a user i can 'Unfollow' from another user.
- As a user i can see all user that i following.
- As a user i can see all my sleep records / activity.
- As a user i can see all sleep records from user that i follow from the previous week.

## 🏦 Setup Project
1. Clone this repository.
2. Change working directory into the project.
    ```bash
   $ cd good_night_api
   ```
3. Install the dependencies by running the following command.
    ```bash
   $ bundle install
   ```
4. Create, migrate, and seeds the database by running the following command.
    ```bash
    $ rails db:setup
    ```

## 🤖 Lint Code
1. Make sure you have [setup the project](#setup-project).
2. Run the following command.
   ```bash
   $ bundle exec rubocop -A
   ```
   
## 🧪 Run Test
1. Make sure you have [setup the project](#setup-project).
2. Run the following command.
   ```bash
   $ rspec
   ```

## ✈️ Run App locally
1. Make sure you have [setup the project](#setup-project).
2. Run the following command.
   ```bash
   $ bundle exec rails server
   ```
3. The project will be served at `localhost` port `3001`. 