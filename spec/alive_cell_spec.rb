require './app/game_of_life/dead_cell'
require './app/game_of_life/alive_cell'
require './app/utils/constants_rules'

describe AliveCell do
  it 'should stay Alive smallest value' do
    alive_cell = AliveCell.new(x: 0, y: 0, world: nil)
    allow(alive_cell).to receive(:alive_neighbours_count) { DIE_FIEWER_NEIGHBOURS_THAN }
    expect(alive_cell.evolve).to eq(alive_cell)
  end

  it 'should stay Alive biggest value' do
    alive_cell = AliveCell.new(x: 0, y: 0, world: nil)
    allow(alive_cell).to receive(:alive_neighbours_count) { DIE_GREATER_NEIGHBOURS_THAN }
    expect(alive_cell.evolve).to eq(alive_cell)
  end

  it 'should die from over population' do
    alive_cell = AliveCell.new(x: 0, y: 0, world: nil)
    allow(alive_cell).to receive(:alive_neighbours_count) { DIE_GREATER_NEIGHBOURS_THAN + 1 }
    expect(alive_cell.evolve.is_a?(DeadCell)).to eq(true)
  end

  it 'should die from under population' do
    alive_cell = AliveCell.new(x: 0, y: 0, world: nil)
    allow(alive_cell).to receive(:alive_neighbours_count) { DIE_FIEWER_NEIGHBOURS_THAN - 1 }
    expect(alive_cell.evolve.is_a?(DeadCell)).to eq(true)
  end
end
