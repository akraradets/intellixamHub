class Reservation < ApplicationRecord
  belongs_to :exam
  belongs_to :room

  after_save :createSeats

  def createSeats
    room = self.room

    for row in 1..room.max_row
      for column in 1..room.max_column
        name = numberToChar(row) + column.to_s
        Seat.create!(
          reservation: self,
          room: room,
          name: name,
          row: row,
          column: column,
          is_extra: false,
          created_by: 'system',
          updated_by: 'system'
        )

      end
    end
    
  end

  def numberToChar(number)
    map = {
      1 => "A",
      2 => "B",
      3 => "C",
      4 => "D",
      5 => "E",
      6 => "F",
      7 => "G",
      8 => "H",
      9 => "I",
      10 => "J",
      11 => "K",
      12 => "L",
      13 => "M",
      14 => "N",
      15 => "O",
      16 => "P",
      17 => "Q",
      18 => "R",
      19 => "S",
      20 => "T",
      21 => "U",
      22 => "V",
      23 => "W",
      24 => "X",
      25 => "Y",
      26 => "Z"
    }
    map[number]
  end
end
