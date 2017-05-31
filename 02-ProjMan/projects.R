# Creating a new project in R studio:
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
# An alternative is to use:
#

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
