# spec file
require 'rspec'
require_relative '../game_of_life'

describe 'Game of life' do
  
  let!(:world) { World.new }
  let!(:game) { Game.new }

	context 'World' do
		subject { World.new }

		it 'should create a new world instance' do
			expect(subject.is_a? World).to be true
		end

		it 'should respond to methods' do
			expect(subject).to respond_to :rows
			expect(subject).to respond_to :cols
			expect(subject).to respond_to :cell_grid
      expect(subject).to respond_to :live_neighbours_around_cell
		end

		it 'checks that cell_grid is an array' do
			expect(subject.cell_grid).is_a? Array
			subject.cell_grid.each do |row|
				expect(row.is_a? Array).to be true
				row.each do |col|
					expect(col.is_a? Cell).to be true
				end
			end
		end

    it 'should detect live  neighbours to the north' do
      subject.cell_grid[0][1].activate
      cell =  subject.cell_grid[1][1]
      expect(subject.live_neighbours_around_cell(cell).count).to eq 1
    end

    it 'should detect live neighbour to the west' do
      subject.cell_grid[1][0].activate
      cell = subject.cell_grid[1][1]
      expect(subject.live_neighbours_around_cell(cell).count).to eq 1
    end

    it 'should detect live neighbours to the east' do
      subject.cell_grid[1][2].activate
      cell = subject.cell_grid[1][1]
      expect(subject.live_neighbours_around_cell(cell).count).to eq 1
    end

    it 'should detect live neighbours to the south' do
      subject.cell_grid[2][1].activate
      cell = subject.cell_grid[1][1]
      expect(subject.live_neighbours_around_cell(cell).count).to eq 1
    end
	end

	context 'Cell' do
		subject { Cell.new }

		it 'responds to methods' do
			expect(subject).to respond_to :alive
		expect(subject).to respond_to :x
			expect(subject).to respond_to :y
		end

		it 'should create a new cell instance' do
			expect(subject.is_a? Cell).to be true
		end

		it 'should set alive status to false by default' do
			expect(subject.alive).to eq false
		end

		it 'initializes properly' do
			expect(subject.x).to eq(0)
			expect(subject.y).to eq(0)
		end
	end

	context 'Game' do
		subject { Game.new }

		it 'responds to methods' do
			expect(subject).to respond_to :world
			expect(subject).to respond_to :seeds
		end

		it 'initializes properly' do
			expect(subject.world.is_a? World).to be(true)
			expect(subject.seeds.is_a? Array).to be(true)
		end
    
    it 'should turn dead cells to life cells' do
      game = Game.new(world, [[0, 1], [1, 1]])
      expect(world.cell_grid[0][1].alive?).to eq true
      expect(world.cell_grid[1][1].alive?).to eq true
    end

	end

	context 'Rules' do
		let!(:game) { Game.new }

		context 'Rule 1 - Any live cell with fewer than two live neighbours dies - under population' do
			it 'kills live cell with 1 live neighbour' do

			end
		end
	end

end
