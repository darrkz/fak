let fak = import "../lib/fak.ncl" in
{
  mcu = "CH552G",
  # 直连模式配置：列出所有按键连接的引脚
  # 假设按键接在 P32, P14, P15, P16, P17, P11，编码器下压接 P33
  board = {
    rows = [],
    cols = [
      fak.Pin.P32, 
      fak.Pin.P14, 
      fak.Pin.P15, 
      fak.Pin.P16, 
      fak.Pin.P17, 
      fak.Pin.P11,
      fak.Pin.P33
    ],
  },
  
  scan_mode = fak.ScanMode.DirectPinKey,

  # 基础层键位定义
  layers = [
    [
      fak.Key.A, 
      fak.Key.B, 
      fak.Key.C,
      fak.Key.D, 
      fak.Key.E, 
      fak.Key.F,
      fak.Key.MediaPlayPause # 编码器下压
    ]
  ],

  # 编码器旋转定义 (假设 A相接P30, B相接P31)
  # 注意：如果旋转方向反了，调换 A B 引脚即可
  inputs = [
    fak.Input.Encoder {
      a = fak.Pin.P30,
      b = fak.Pin.P31,
      clockwise = fak.Key.AudioVolUp,
      counter_clockwise = fak.Key.AudioVolDown,
    }
  ],
}
