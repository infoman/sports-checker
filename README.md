# README

## Database setup

You can use `.env` file in project root to configure database connections
or override other system environment variables.
Look at config/database.yml for available variables

Run `bin/rake db:seed` to fill the database with a sample records set.
This may take some time (about 2 minutes on my PC) because it creates a lot of records for players' counter and achievement data.

## Available methods
* Call `player.achieved?(match, achievement)` on a player instance to check if
  that player had specific achievement in a match.
* Call `player.achieved_last?(achievement)` to check if that player had
  specific achievement in last 5 matches. You can also override matched count
  by passing a named argument `match_count` like that:
  `player.achieved_last?(achievement, match_count: 6)`
* Call `Player.top(achievement)` to find top 5 players that have this
  achievement in most matches. You can also use a named argument `count`
  if you want other number of players, like `Player.top(achievement, count: 3)`.

  This also applies to any players collection, for example, to members of
  a team.
* Call `team.top_players(achievement)` as a shorthand method to find top 5
  players of a team. It calls the players `top` scope internally and can also
  accept `count` argument.
* Call `player.set_counter(match, counter, value)` to update value of
  a specific counter. This will also award achievements assotiated with that
  counter automatically, if value exceeds or is equal to achievement's
  threshold.
* Call `player.award_achievement(match, achievement)` to manually award
  achievement to player regardless of counter values.

For any of the above methods:

* `match` can be a match id or match object instance
* `achievement` can be an achievement id, name, or instanceinstance
* `counter` can also be a counter id, name, or instance
