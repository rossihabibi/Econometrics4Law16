# Holy trinity 
# A Google is your friend (don't log in though, they track your searches)
# B Read error messages entirely (not just the two first words)
# C Do exactly as I ask you to

# 1. Do you have Rstudio? If yes -> open; if no -> google, download, install and open.
# 2. Locate your drive (your folder) on the computer (on university computers, choose a drive that is not erased everytime you log out) -> this is YOURDRIVELOCATION
# 3. In Rstudio, click on File > New Project > New directory > Empty project
# 6. Directory name : Econometrics4Law16
# 7. Create as a sub-directory of : Browse -> to YOURDRIVELOCATION
# 7bis. Create Project
# 8. Open a new .R file, and type the command (don't copy), keep the cursor on the same line and click on your keyboard CTRL + ENTER (or CMD + ENTER on mac): 
getwd()
# 9. It should give you a character string output that ends with "Econometrics4Law16"
# Example output of 9 on my mac : "/Users/rossi/Dropbox/Econometrics4Law16"
# 9bis. Google if you do not know what's "character string", or "output"
# 10. In Rstudio, click on Tools > Global Options > Code : check the case "Soft-wrap R source files"
# 11. In Rstudio, click on Tools > Global Options > Pane Layout : click on the top left pane, change to source; click on top right pane, and change to console
# 12. Google if you do not know what is source, what is console

# 13. If you're using your own computers run the commands :
install.packages("AER")
install.packages("foreign")

# 14. Create a new .R file, and call it ps4ex1.R
# 15. On github, locate ps4ex1-st.R : you'll take the commands from there, but you'll type them and you will not copy them.