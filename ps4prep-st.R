# Holy trinity 
# A Google is your friend (don't log in though, they track your searches)
# B Read error messages entirely (not just the two first words)
# C Do exactly as I ask you to

# 1. Do you have Rstudio? If yes -> open; if no -> google, download, install and open.
# 2. Choose a folder on the computer where you want to save your work (on university computers, choose a drive that is not erased everytime you log out) -> this is YOURDRIVELOCATION
# 3. In Rstudio, click on File > New Project > New directory > Empty project
# 6. Directory name : Econometrics4Law16
# 7. Create as a sub-directory of : Browse -> to YOURDRIVELOCATION
# 7bis. Create Project
# 8. Open a new .R file, save as ps4ex1.R  ; In it, type the following command : 
getwd()
# 8bis. Did you copy the command? I told you to type, not copy. Erase and type. Save by clicking CTRL + S (or CMD + S on mac), keep the cursor on the same command line and click on your keyboard CTRL + ENTER (or CMD + ENTER on mac).
# 9. It should give you a character string output that ends with "Econometrics4Law16"
# Example output of 9 on my mac : "/Users/rossi/Dropbox/Econometrics4Law16"
# CTRL + ENTER runs the line the cursor is in; it's an RStudio trick, not an R trick
# 9bis. Google if you do not know what's "character string", or "output". or the difference between Rstudio and R
# 10a. In Rstudio, on the Files Pane, now you should see a folder with only a .Rproj file; click New Folder, and call the new folder data
# 10b. In Rstudio, click on Tools > Global Options > Code : check the case "Soft-wrap R source files"
# 10c. In Rstudio, click on Tools > Global Options > Pane Layout : click on the top left pane, change to source; click on top right pane, and change to console
# 12. Google if you do not know what is source, what is console
# 13. If you're using your own computers run the commands :
install.packages("AER")
install.packages("foreign")
# 14. Google what's an R package, and what do AER and foreign packages contain
# 15. On github (that's the link that I sent you on the first computer session), locate ps4ex1-st.R : you'll take the commands from there, but you'll type them and you will not copy them.