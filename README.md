# README

This is a demonstration app for the concepts defined in my
blog. `Broadcasting your turbo streams as you want them in Rails 7
`.

Running locally

1. Create the databases `rails db:create`
2. Run the migrations `rails db:migrate`
3. Run the app `rails s`

### Users

After running the app you can visit `localhost:3000` and create accounts.

### Posts

TODO: Add UI for post creation and display.

You can create a new post in the rails console using

```rb
user.posts.create(content: 'Some content')
```

The updates will be broadcast to all the connected sessions.

### Groups

TODO: Add UI for group creation and display.

You can create new groups through the rails console

```rb
Group.create(name: 'Developers')
```

Using the same signup flow you can add new users to groups.

and when you create posts through users of these groups the updates will broadcast to all the users in the group.