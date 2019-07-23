
# Creating a new project in Rstudio --------------------------------------------------

# Create a project for the current project (will make it easier to return)
#
# 1. Click the “File” menu button, then “New Project”.
# 2. Click “Existing Directory”.
# 3. Navigate to the current directory.
# 4. Click the “Create Project” button.
#
# Note the inclusion of a git tab now.
# Can use this to navigate back File -> Recent Projects

# Now create a new project:
#
# 1. Click the “File” menu button, then “New Project”.
# 2. Click “New Directory”.
# 3. Click “Empty Project”.
# 4. Type in the name of the directory to store your project, e.g. “my_project”.
# 5. Make sure that the checkbox for “Create a git repository” is selected.
# 6. Click the “Create Project” button.
#
# Can now create the suggested layout.
#



# Using project templates -------------------------------------------------

# Install the package if it is not already there
install.packages("ProjectTemplate")

# Load the package
library("ProjectTemplate")

# Create the project. The "~" symbol is a short cut to your home directory.
create.project("~/my_project2", merge.strategy = "allow.non.conflict")

# Change the working directory to the new project file.
setwd("~/my_project2")

# On your Files tab in Rstudio click on the gear and select
# "Go to Working Directory". You should now see the directories
# created by the ProjectTemplate package.

# Load the project info
load.project()

# This command will:
# * Read in the global configuration file contained in `config`.
# * Load any R packages you listed in he configuration file.
# * Read in any datasets stored in `data` or `cache`.
# * Preprocessing your data using the files in the `munge` directory.
#
# More information in the Readme.md file.

# Alternative is to use Rstudio to create one of it's own projects:
#
# File -> "New Project..." -> Existing Directory
#
# Navigate to ~/my_project2 and click on "Create Project".


# Challenge 1 -------------------------------------------------------------

# 1.1 Create a new git enabled project
#
# Create a new empty project my_project2. Make sure that this is git enabled.

# Add a Readme.md file (File -> New File -> Text file) with the following 
# text:


# My test project (include this hash but not this comment)
# This is my test Trieste repository (remove the hash in the file and this comment)

# File -> Save As...
#
# Call the file Readme.md. Save it at the root directory.
# Switch to the git window. Add and commit this file with the
# .gitignore and my_project2.Rproj file.

# 1.2 Create GitHub repository and push the contents
#
# Go to your GitHub account and create a new repository my_project2.
# When you create your project you should get instructions on how to push
# an existing project to GitHub. On the Git pannel click on the "More" menu
# item and select "Shell...". This will open up a shell command in the 
# your new project directory. Type the commands GitHub is suggesting to you
# there (this should push up your project content to GitHub). You should now
# see your content on GitHub.

# 1.3 Modify your Readme.md
#
# Modify your Readme.md file (add/remove content as you like).
# Save the file, commit the file (go to the Git panel select the file
# and then click on Commit). A window will come up where you need to put
# in a sensible commit message. Once this is done click on the Push button
# and that should push the contents to GitHub - do you see those changes?

# 1.4 Remotely modify your Readme.md
#
# On GitHub click on the Readme.md file. Select Edit (the pencil), modify the content
# and save (add a sensible commit message there as well).
#
# In Rstudio click on the Pull button. Do you see the changes you made being
# ported back to your local Readme.md version?

# 1.5 Ignorning files
#
# 1. Create a directory within your project called graphs (in the files
#    view click on the "New Folder" item).
# 2. Modify the .gitignore file to contain graphs/ so that this 
#    disposable output isn’t versioned.
# 3. Commit your .gitignore file.
# 4. Push the content.

# If you have managed to do all these steps you should now be in a position to 
# use Rstudio with GitHub (or any other remote git repository).
