Unit 8: Group Milestone - README Example
===

# ReminderApp 

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description

Scheduling Application that motivates people who have similar goals and interests to connect, learn, and progress together. Creating a community in which people encourage each other to take action towards such goals/interest.

### App Evaluation
- **Category:** Productivity / Social Networking
- **Mobile:** This app would be primarily developed for mobile.
- **Story:** Helps individuals keep track of their schedule, ensure productivity using effective alarm system/peer pressure, encourage habit tracking activities, and connects people with the same goals.
- **Market:** Any individual could choose to use this app.
- **Habit:** This app could help increase productivity if used daily.
- **Scope:** First, we would start with allowing users to add their schedules, goals, and reminders in the app. Then, we will develop more ways to encourage users to stay on track of their schedule using rewarding systems. Lastly, we plan to make it possible for users to interact with each other and pursue goals together.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] Users can sign up
- [x] Users can log in
- [x] Navigate between tabs
- [x] Set up goals and remiders.
- [x] Scedule/calendar page
- [x] Logout
- [x] Stay signed in
- [x] Nice TO-DO page
- [x] Launch screen
- [ ] Settings (Accesibility, Notification, General, etc.)

<img src='http://g.recordit.co/7DS4TmTyKm.gif' />

<img src='http://g.recordit.co/V8yScgkPx1.gif' />

<img src='http://g.recordit.co/dkm77jwRML.gif' />

**Optional Nice-to-have Stories**

* Get recommendation for timeline to work on their schedule
* Connect with friends, work in pair/group, remind/encourage each other
* Upload 24-hour stories of daily achievement
* Have a reward system for completing each task
* Connect to personalized music playlists, and share the playlist with your peers

### 2. Screen Archetypes

* Login 
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information to be properly matched with another person. 
   * ...
* Messaging Screen - Chat for users to communicate (direct 1-on-1)
   * Upon selecting music choice users matched and message screen opens
* Profile Screen 
   * Allows user to upload a photo and fill up their schedule for the week/ day.
* Settings Screen
   * Lets people change language, and app notification settings
   
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile/Settings 
* Friend Search and Interest Groups
* Schedule/ to-do list
* Reminder Tab (Home)

Optional:
* Music playlists
* Stories
* Reward progress


**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available.
* Profile -> Text field to be modified. 
* Schedule/ to-do list -> Pick time for the activity
* Reminder Tab (Home) -> Move to activity's information and message to your partner for this activity.
* Friend Search and Interest Groups -> Search for friends and chat boxes.
* Settings -> Toggle settings.

## Wireframes
<img src="https://i.imgur.com/l7bsLfm.jpg" width=800><br>

## Schema 
### Models
#### Users

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userId        | String   | unique id for the user (default field) |
   | name          | String   | user name |
   | image         | File     | profile image |
   | goal          | List     | list of goals |
   
#### Reminder

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the reminder (default field) |
   | task          | String   | upcoming task |
   | deadline      | Date     | profile image |
   | lateDate      | Count    | number of late date |
   | partner       | Pointer to User | your friend info |

#### Conversation

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | friendID      | String   | unique id for your friend (default field) |
   | friendName    | String   | name of friend |
   | message       | Dictionary | database of text messages |
  
### Networking
#### List of network requests by screen
   - Home Screen
      - (Read/GET) Query all reminders
      - (Create/POST) Create a reminder
      - (Delete) Delete an existing reminder
      - (Update/PUT) Update a reminder
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
   - Setting
      - (Read/GET) Query setting information
      - (Update/PUT) Update setting option
   - Message
      - (Read/GET) Query all text messages
      - (Create/POST) Send a text message

