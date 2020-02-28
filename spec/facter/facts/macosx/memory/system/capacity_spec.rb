# frozen_string_literal: true

describe Facter::Macosx::MemorySystemCapacity do
  describe '#call_the_resolver' do
    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'memory.system.capacity', value: '15.53%')

      allow(Facter::Resolvers::Macosx::SystemMemory).to receive(:resolve).with(:capacity).and_return('15.53%')
      allow(Facter::ResolvedFact).to receive(:new).with('memory.system.capacity', '15.53%').and_return(expected_fact)

      fact = Facter::Macosx::MemorySystemCapacity.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end