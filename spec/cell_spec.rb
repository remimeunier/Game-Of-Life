require './app/game_of_life/cell'

describe Cell do
  it 'should find its neighbours coordinates' do
    cell = Cell.new(x: 0, y: 1, world: nil)
    expect(cell.neighbours_coordinates).to eq([[-1, 0], [-1, 1], [-1, 2], [0, 0],
                                               [0, 2], [1, 0], [1, 1], [1, 2]])
    cell = Cell.new(x: 10, y: 10, world: nil)
    expect(cell.neighbours_coordinates).to eq([[9, 9], [9, 10], [9, 11], [10, 9],
                                               [10, 11], [11, 9], [11, 10], [11, 11]])
  end
end
