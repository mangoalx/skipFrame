# skipFrame
  This project is for skipFrame check of video playback on canvas. 

ow the test procedures are (not easy to be automated):
1 record video in 240fps mode, the max length is 8 minutes, limited by the device (Nexus 6P);
2 on the test computer, create a folder, copy the video file into it;
3 open the video file with VLC player, and take a snapshot;
4 then open the snapshot with imageMagick, use crop tool to draw a rectangle around the counter number area, note down the crop size;
4 open a terminal, enter the folder where the video file was copied into, run command "checkSkipM.sh video.mp4 cropSize" (could be in format "aaaxbbb+ccc+ddd" or "aaa:bbb:ccc:ddd")
    use checkSkip.sh if multi-thread is not desired
    make sure the folder where these scripts reside in is added to the $PATH
5 the summery of test will be displayed on screen, check result.txt for details, output.txt for ocr result output, all the cropped images are saved in the tmp sub-folder in case we need to verify the test result.

  - recording video in 120fps mode is also acceptable, it may increase the chances of counting fake skips (maybe 0.05% higher), the process time could be reduces to 1/2
