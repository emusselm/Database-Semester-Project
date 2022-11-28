# Database-Semester-Project
This is the repository for our database group project.<br>
To run this project:<br>
  1\. Download a mySQL interface for loading and running SQL code. <br>
  2\. Create a database called "store" to insert tables into. <br>
  3\. Run StoreSchema.sql within the scope of the store database within the mySQL interface to intilize the tables on your machine. <br>
  4\. If you populate the tables with data of your own, run the ClearStoreSchema.sql file to clear the tables. <br><br>
Download and Install Xampp:<br>
  1\. Xampp can be downloaded at: https://www.apachefriends.org/download.html<br>
  2\. Follow the setup dialogue to initialize the environment<br>
  3\. Download the htdocs zip file and add the contents to on the C:/xampp/htdocs folder. <br>
    * please be sure to update the password, port, and host of your mysql database in the connection.php file located in the htdocs.<br><br>
Data Generation:<br>
  1\. Download the two data generation notebooks and place them in htdocs with the image folders.<br>
  2\. Run the 'Product and Data Generation' python notebook as a notebook or as a script to load all of the images into the database.<br>
  3\. Run the 'User Generation" python notebook as a notebook or as a script to load all of the images into the database. <br>
  ** you must have a python interpretor/Jupyter Notebook interface  on your computer to run these scripts<br><br>
Setting it All Up: <br>
  1\. Using the XAMPP control panel, run an Apache server on your local host.<br>
  2\. On the same panel, start running the MySQL module as well. <br>
  3\. In a browser, load index.php to view the homepage of the e-commerce website. <br><br>

  
  
We are thankful to Mustafa Alawi for the template of the Ecommerce website to adapt to the needs and schema of our project. <br>
