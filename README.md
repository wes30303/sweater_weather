# Technical Requirements
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 5.1.2</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>Launchy</li>
  <li>Orderly</li>
  <li>Shoulda-Matchers</li>
  </ul>

# Project Files Description
### app/controllers/api/v1 

Takes user information and grabs the information and passes them to created

### app/serializers

Serializers for formatting forecast and road trip data

### app/models/user.rb

It will validate the Email is unique and will gen a new key

### app/facades

Will connect to the services and be able to create a poro. 

### app/spec/requests/api/V1

Testing suite for API calls to endpoints

# Database Schema

![image](https://user-images.githubusercontent.com/54329737/192823847-04dd2e4e-b862-4442-b553-fa03d0ddb46a.png)
  <!-- GETTING STARTED -->
<h2 id="getting-started">Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/sweater_weather</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/sweater_weather</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![image](https://user-images.githubusercontent.com/54329737/192827956-6809b796-a020-4f0e-bcc5-66449fa07efd.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:wes30303/sweater_weather</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>7. </b> Inside your project directory, install <a href="https://github.com/laserlemon/figaro"> Figaro</a> via your terminal.</p>
<pre><code>$ bundle exec figaro install</code></pre>

<p><b>8. </b> Install <a href="https://lostisland.github.io/faraday/"> Faraday</a>.</p>
<pre><code>$ bundle exec faraday install</code></pre>

<p><b>9. </b> Add API key to config/applicalion.yml</a>.</p>
<pre><code>$ map_api_key: XXXXX, whether_api_key: XXXXX</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

# Api EndPoints
![image](https://user-images.githubusercontent.com/54329737/192825486-9ee2e761-4f42-49bb-850a-79fcaa195f25.png)

### Able To Get A Forcast

![image](https://user-images.githubusercontent.com/54329737/192825486-9ee2e761-4f42-49bb-850a-79fcaa195f25.png)

### Able To Create A User 
![image](https://user-images.githubusercontent.com/54329737/192824379-d23a0246-f192-4aa6-8646-6fa8ea03637a.png)

### Able to login
![image](https://user-images.githubusercontent.com/54329737/192824534-a1aa0f5c-b439-48b5-b7e3-3915ba91f399.png)

### It Is Able To Get A Road Trip
![image](https://user-images.githubusercontent.com/54329737/192824706-add8ba40-9365-4878-b212-3eaa5b7ee2a5.png)

# Credit
<h3>Wesley Miranda</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/wes30303)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/wesley-miranda-80a725196/)
