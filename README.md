# README

## Approach
I took a bit of a liberal approach on this project. It actually sounded
pretty entertaining, so I wanted to see if I could add some login credentials
to the application as well. I think that it did result in a better user experience.

There were some challenges with that approach. More on those in the 'Learning Experiences'
section bellow.

## Planning Stage
### Basic Mockups on my Balsamiq 
* [Login Screen](https://i.imgur.com/AgiLH6U.png)
* [After Login Screen](https://i.imgur.com/quPfTUp.png)
* [Desktop](https://i.imgur.com/6w5Fq23.png)
* [Mobile](https://i.imgur.com/9MVowYU.png)

### Implementation Considerations
My first urge was to use React.js. I've been dying to give it a try, but I determined
that it would be out of scope for this application since I really wanted to make it
demonstrate some of the skills that I already have.

I wanted to bring in bootstrap for the basic UI setup. There was no requirement on the
user experience, but, at the same time, I didn't want to have a completely terrible
user experience either. Bootstrap is easy to drop in, so I did.

I prefer to do mobile first design when it comes to UI development. If this were a
project that was going to build up in scale, I probably would have went with that
approach. However, the desktop UI is good enough for this purpose I think.

### Trim Scope to MVP
As you can see in the mockups, I originally wanted to make the user experience more
entertaining and display a bit more of my personality. However, when I got the planning
all done, I looked in to how much time that it would take to do all of the playful
aspects that I had in mind and decided to cut a couple of them.

Here are some of the items that I considered in order of priority (Agile style):

(Accepted)
* WebSockets instead of polling
* simplified spec coverage
* decent eventing infrastructure
* basic login and logout notifications
* naming support
* moderate spec coverage
  * VCR would have been useful for mocking the `HTTParty` call

(Rejected)
* mobile first development
* extended fault tolerance
* action cable
* fully covered integration specs
* react
* fading of the image
* fading in and out in the login screen
* storing the sites, updating the images and displaying in a true 'card' style
* improved login and logout notifications

## Implementation Notes
### Known Issues
* can only run the test back to back for a limited number of times
* the image should be showing at the top and more pretty
  * image dimensions are not supported
* is not optimized for mobile
* navbar does not match the card size (ugly so I included it)

### JavaScript Structure
I wanted to build out some scaffolding on the events structure such that more
functionality could be built off of it in the future. The idea is to make it
clear so that other developers will be able to clearly understand what is going
on and not accidentally deviate from the intended purpose.

I structured the welcome page in a way that was not overly messy, yet, kept the
jQuery structure. I think that it would have been more fun to use React.js to do
this, but I decided against it in the planning stage because of the possibility
of spending too much time there setting it up.

### GIT Log
I built the basic feature sets on feature branches as I usually do. My standard
workflow is to squash the basic feature branches to one commit with a descriptive
commit message and then merge to master. Hopefully, that works for you for the
purposes of this exercise.

### Project Structure
I think that the project structure is pretty standard for a rails project with a
free form JavaScript implementation. In a framework, it is easier to seperate out
the JavaScript view logic from the controller logic, but I still think that I did
a decent job considering.

## Viewing the Application
### Heroku
1) Visit [here](https://ogp-demo.herokuapp.com)
2) Enter your full name or just your first name
3) Put in the desired OGP enabled, fully qualified website url in the input field
4) Submit the form
5) Observe the title and image appear in the card

### Local
1) Clone the project [here]()
2) Ensure that postgresql is running locally
3) `rails db:setup`
4) `rails db:migrate`
5) `rails s`

## Learning Experiences
I want to take time to thank you for the enjoyment that I got out of this exercise.
Unlike many other 'homework' styles of exercises, I actually learned something very
interesting about my skills as a developer.

Scope creep is something that has to be managed by product teams and developers in
software all of the time. That is something that I have been doing for years, and am
constantly on the lookout for. However, inside of a small exercise like this one, I
did not take that in to consideration on the scale that I should have. There were
basic considerations as explained in the README, but I would have liked to break it
down into a more granular approach like a would in a longer term project.


## GIFs
### Basic Login, Run, Logout
[View it here.](https://i.imgur.com/oC8Tr3j.gifv)
