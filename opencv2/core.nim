
const
  header = "<opencv2/core.hpp>"

import wraptool
{.passL:"-lopencv_core".}
{.push hint[XDeclaredButNotUsed]: off.}
type
  InputArray* = concept t
#    t.channels() is cint
#    t.depth() is cint
#    t.empty() is bool
#    t.release()
#    t.clear()

  OutputArray* = var InputArray
{.pop.}

wrapheader header:
  CV_8U: cint
  CV_8S: cint
  CV_16U: cint
  CV_16S: cint
  CV_32S: cint
  CV_32F: cint
  CV_64F: cint
  CV_8UC3: cint
  CV_8UC4: cint
  USRTYPE1: cint
  CV_FONT_HERSHEY_COMPLEX_SMALL: cint
  namespace "cv":
    class "Point_" as Point[T]:
      proc Point(x, y: T)

    class "Size_" as Size[T]:
      proc Size(w, h: T)
      proc area*(): T
      width: T
      height: T

    class "Rect_" as Rect[T]:
      proc Rect(x, y, w, h: T)
      proc area*(): T
      proc contains*(point: Point[T]): bool

    class "Scalar_" as Scalar[T]:
      proc Scalar(v0, v1: T, v2: T = 0, v3: T = 0)
      proc `[]`(i: cint): T

    class Mat:
      proc Mat(rows, cols, t: cint)
      proc Mat(size: Size[cint], t: cint)
      proc Mat(rows, cols, t: cint, data: pointer, step: culong = 0)
      proc clone(): Mat
      proc copyTo(target: OutputArray)
      proc copyTo(target: OutputArray, mask: InputArray)
      proc adjustROI(top, bottom, left, right: cint): Mat
      proc reshape(cn: cint, rows: cint = 0): Mat
      proc zeros(size: Size[cint], t: cint ): Mat
      proc depth(): cint
      proc channels(): cint
      proc size(): Size[cint]
      proc empty(): bool
      proc release()
      proc clear()
      proc addref()
      proc `()`(roi: Rect[cint]):var Mat
      AUTO_STEP: culong
      cols: cint
      rows: cint
      data: cstring

    proc addWeighted(src1: InputArray,  alpha: cdouble, src2: InputArray, beta, gamma: cdouble, dst: OutputArray, dtype:cint = -1)
    proc add(src1: InputArray, src2: InputArray, dst: OutputArray, mask: InputArray = newMat(), dtype:int = -1)
    proc rectangle(img: Mat, pt1: Point, pt2: Point, color: Scalar, thickness: cint = 1, lineType: cint = 8, shift: cint = 0)
    proc rectangle(img: Mat, rec: Rect, color: Scalar, thickness: cint = 1, lineType: cint = 8, shift: cint = 0)
    proc mean(src: InputArray, mask: InputArray = newMat()): Scalar[cdouble]
    proc getTextSize(text: cstring, fontFace: cint, fontScale: cdouble, thickness: cint, baseLine: ptr cint): Size[cint]
    proc putText(img: var Mat, text: cstring, org: Point[cint], fontFace: cint,
                 fontScale: cdouble, color: Scalar[cdouble], thickness: cint = 1,
                 lineType: cint = 8, bottomLeftOrigin: bool = false )

proc `=`*(eq1: var Mat, eq2:Mat) =
  eq2.copyTo(eq1)

when isMainModule:
  var p = newPoint(1, 8)
  var sc = newScalar(3.cint, 5.cint, 4.cint, 7.cint)
  var s = newSize(4, 5)
  var rct = newRect(2, 5, 10, 15)
  let im = newMat()
  var m = newMat(10, 10, 8)
  var mc = m.clone()
  mc.copyTo(m, im)
  echo ($m.AUTO_STEP)
  mc.destroyMat()
  m.destroyMat()
  echo ($(s.area()))
  echo ($(rct.area()))
  echo ($(rct.contains(p)))
