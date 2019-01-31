require './app/game_of_life/dead_cell'
require './app/game_of_life/alive_cell'
require './app/utils/constants_rules'

describe DeadCell do
  it 'should stay dead of under population' do
    dead_cell = DeadCell.new(x: 0, y: 0, world: nil)
    allow(dead_cell).to receive(:alive_neighbours_count) { BORN_EXACT_NEIGHBOURS - 1 }
    expect(dead_cell.evolve).to eq(dead_cell)
  end

  it 'should stay dead of over population' do
    dead_cell = DeadCell.new(x: 0, y: 0, world: nil)
    allow(dead_cell).to receive(:alive_neighbours_count) { BORN_EXACT_NEIGHBOURS + 1 }
    expect(dead_cell.evolve).to eq(dead_cell)
  end

  it 'should get alive' do
    dead_cell = DeadCell.new(x: 0, y: 0, world: nil)
    allow(dead_cell).to receive(:alive_neighbours_count) { BORN_EXACT_NEIGHBOURS  }
    expect(dead_cell.evolve.is_a?(AliveCell)).to eq(true)
  end
end
