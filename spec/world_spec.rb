require './app/game_of_life/world'
require './app/game_of_life/alive_cell'
require './app/game_of_life/dead_cell'
require './app/utils/basic_patterns'

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

  it 'still patterns should stay still' do
    STILL.each do |still_pattern|
      w = World.new(starting_position: still_pattern[:form])
      alived = w.cells.select { |cell| cell.is_a?(AliveCell) }
      w.next_generation
      expect(w.cells.select { |cell| cell.is_a?(AliveCell) }).to eq(alived)
    end
  end

  it 'Oscillators patterns should stay Oscillat' do
    OSCILLATERS.each do |ocsi_pattern|
      w = World.new(starting_position: ocsi_pattern[:form])
      alived = w.cells.select { |cell| cell.is_a?(AliveCell) }
      (ocsi_pattern[:period]).times do
        w.next_generation
      end
      expect(w.cells.select { |cell| cell.is_a?(AliveCell) }.length).to eq(alived.length)
    end
  end

end
