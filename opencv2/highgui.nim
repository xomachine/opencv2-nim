import wraptool
from opencv2.core import InputArray, Mat
const
  header = "<opencv2/highgui/highgui.hpp>"
{.passL:"-lopencv_highgui".}
#{.passL:"-lstdc++".}

type
  TrackbarCallback* = proc(pos: cint, data: pointer){.cdecl.}

wrapheader header:
  CV_LOAD_IMAGE_COLOR: cint
  namespace "cv":
    WINDOW_NORMAL: cint   #the user can resize the window (no constraint)  / also use to switch a fullscreen window to a normal size
    WINDOW_AUTOSIZE: cint #the user cannot resize the window, the size is constrainted by the image displayed
    WINDOW_OPENGL: cint   #window with opengl support
    proc imdecode(data: InputArray, flags: cint): Mat
    proc imread(filename: cstring, flags: cint = 1): Mat
    proc imshow(windowname: cstring, img: InputArray)
    proc namedWindow(windowname: cstring, flags: cint = WINDOW_AUTOSIZE )
    proc destroyAllWindows()
    proc destroyWindow(window: cstring)
    proc waitKey(delay: cint = 0): cint
    proc createTrackbar(trackbarname: cstring, winname: cstring, value: ptr cint, count: cint, onChange: TrackbarCallback = nil, userdata: pointer = nil): cint

when isMainModule:
  echo ($WINDOW_NORMAL)
