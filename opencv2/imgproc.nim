from wraptool import wrapheader
from opencv2.core import InputArray, OutputArray, Size
{.passL:"-lopencv_imgproc".}

wrapheader "<opencv2/imgproc/imgproc.hpp>":
  CV_BGRA2BGR: cint
  namespace "cv":
    INTER_LINEAR: cint

    proc resize(src: InputArray, dst: OutputArray, dsize: Size, fx: cdouble = 0, fy: cdouble = 0, interpolation: cint = INTER_LINEAR)
    proc cvtColor(src: InputArray, dst: OutputArray, code: cint, dstCn: cint = 0)

