# coding: utf-8

# 盤に配置する石, 壁, 空白
BLACK = 1
WHITE = -1
EMPTY = 0
WALL = 2

# 石を打てる方向(2進数のビットフラグ)
NONE = 0
UPPER = 1
UPPER_LEFT=2
LEFT=4
LOWER_LEFT=8
LOWER=16
LOWER_RIGHT=32
RIGHT=64
UPPER_RIGHT=128

# 盤のサイズと手数の最大数
BOARDSIZE=8
MAXTURNS=60

# 盤を表すクラスの定義
class Board
  # 盤を表す配列
  @rawBoard = nil
  # 石を打てる場所を格納する配列
  @movableDir = nil

  # 盤を(再)初期化
  def init
    @turns = 0
    @current_color = BLACK

    # 配列が未作成であれば作成する
    if @rawBoard == nil
      @rawBoard = Array.new(BOARDSIZE + 2).map{Array.new(BOARDSIZE + 2, EMPTY)}
    end
    if @movableDir == nil
      @movableDir = Array.new(BOARDSIZE + 2).map{Array.new(BOARDSIZE + 2, NONE)}
    end

    # @rawBoardを初期化, 周囲を壁（WALL)で囲む
    for x in 0..BOARDSIZE + 1 do
      for y in 0..BOARDSIZE + 1 do
        @rawBoard[x][y] = EMPTY
        if y == 0 or y == BOARDSIZE + 1 or x == 0 or x == BOARDSIZE + 1
          @rawBoard[x][y] = WALL
        end
      end
    end

    # 石を配置
    @rawBoard[4][4] = WHITE
    @rawBoard[5][5] = WHITE
    @rawBoard[4][5] = BLACK
    @rawBoard[5][4] = BLACK

    # self.initMovable
  end
end

# Boardインスタンスの作成
board = Board.new

# 盤を初期化
board.init
        
