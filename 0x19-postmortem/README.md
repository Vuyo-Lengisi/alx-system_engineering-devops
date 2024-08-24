# Web_stack_debugging_3 Postmortem
On the 13th of August 2024 at approximately 06:00am (SAST) our servers ran an error of **500 Internal Server error**. Being on call, I had to run daignosis on our servers.

## Debugging the issues
steps follow to debug were as follows:
- at 06:11 I ran **ps aux | grep apache3** on the servers
            - used tmux to run strace attached to PID
            - We needed to find the PID of the apache2 proccess 
- at 06:15 
            -ran strace attached to each PID switching between tmux windows
- at 06:28
            - atter running curl  a couple of time on our address we noticed a "No such file or directory" message
- at 06:30  
            - I could also see a parent directory housing a non-existing file named "/var/www/html/wp-includes/calss-wp-locale.phpp" which is a typo causing the error
            - I continued to run strace on other PID's

# issue found **"/var/www/html/wp-includes/calss-wp-locale.phpp"** which is a typo causing the error 
## used grep to find the "phpp" extensions giving us the error
- fixed the typo from **"phpp"** to **"php"**

### Wrote/automated a file using pupp