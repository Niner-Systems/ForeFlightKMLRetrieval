# Exporting all KML tracklogs from Foreflight

## Why?
Products like [FlySto](https://www.flysto.net/logs?aircraft=cdzzw2) came out after many of us had a many tracklogs in our ForeFlight accounts. ForeFlight does not provide a way to download all of your tracklogs as kml files and requires you to select and download every one individually. I was not going to do this hundreds of times - so I scripted it.

## No Warranty
I provide no warranty or guaranty that this will work, as Foreflight may alter their API calls at anytime. I worked for me and others the day I uploaded it here. I welcome pull requests and enhancements. But I intentionally didn't put a huge amount of time into it since api calls can change anytime since ForeFlight does not provide a public API for this information.

## Prereq
- [bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))
- [curl](https://curl.se/)
- [jq](https://github.com/jqlang/jq/wiki/Installation) 
- Knowledge of how to run command line programs or a friend with basic nerd knowledge

## How To Use

1. Acquire the curl command from Foreflight for getting all of your tracklog UUIDs, this video shows you how to obtain it: 
[https://youtu.be/kJTHsCT75Lc](https://youtu.be/kJTHsCT75Lc) 
[<img width="1239" alt="image" src="https://github.com/user-attachments/assets/8629997b-9106-4bba-9f0f-3d9ad00cf54e" />](https://youtu.be/kJTHsCT75Lc)
   
2. Replace the contents of [your_curl_command](your_curl_command) with the curl command now in your clipboard. It should appear somewhat similar to what is already in the file. The repo file had my tokens redacted. Replace it all just as you see it - do not add a blank line to the top and make sure the first line is only the url and ends with a \ like in the example file. The first line gets replaced inorder to execute multiple requests. It gets replaced in order to increase the list from 20 tracks to up to 5000 and it gets replaced to make the repeated calls for the kml file.

3. run [downloadKMLs.sh](downloadKMLs.sh)
4. Results are in a `tracks` directory that gets created

