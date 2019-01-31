require './app/game_of_life/world'
require './app/game_of_life/alive_cell'
require './app/game_of_life/dead_cell'

describe World do

  it 'should initilize starting position' do
    w = World.new(starting_position: [[0,0]])
    expect(w.cells.length).to eq(9)
    expect(w.cells.select { |cell| cell.is_a?(AliveCell) }.length).to eq(1)
    expect(w.cells.select { |cell| cell.is_a?(DeadCell) }.length).to eq(8)
  end

  it 'should find cell_at' do
    w = World.new(starting_position: [[0,0]])
    expect(w.cell_at(0,0).is_a?(AliveCell)).to eq(true)
    expect(w.cell_at(1,1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(1,0).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(1,-1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(0,1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(0,-1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(-1,1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(-1,0).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(-1,-1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(2,2)).to eq(nil)
  end

  it 'next generation should call evolve on every cells' do
    w = World.new(starting_position: [[0,0]])
    w.next_generation
    expect(w.cells.length).to eq(9)
    expect(w.cell_at(0,0).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(1,1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(1,0).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(1,-1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(0,1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(0,-1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(-1,1).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(-1,0).is_a?(DeadCell)).to eq(true)
    expect(w.cell_at(-1,-1).is_a?(DeadCell)).to eq(true)
  end
end
