require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# # If the airport is full then no planes can land

# describe Airport do

  describe Airport do
    let(:taking_off_plane){double(:plane, take_off: true )}
    let(:landing_plane){double(:plane, land: true )}

    it 'has a capacity' do
      expect(subject).to respond_to(:capacity)
    end

    it 'has weather' do
      expect(subject).to respond_to(:weather)
    end

    describe '#request_landing' do
      it 'receives a plane when successful' do
        subject.request_landing(landing_plane)
        expect(subject.planes).to include(landing_plane)
      end

      it "raises error if over capacity" do
        subject.capacity.times {subject.request_landing(landing_plane)}
        expect{subject.request_landing(landing_plane)}.to raise_error "landing request denied, Airport is full"
      end

      it "allows capacity to be specified at initialization" do
        random_number = rand(1..100)
        airport = Airport.new(random_number)
        expect(airport.capacity).to eq(random_number)
      end

    end

    describe '#request_take_off' do
      it 'releases plane when successful' do
        subject.planes << taking_off_plane
        subject.request_take_off(taking_off_plane)
        expect(subject.planes).not_to include(taking_off_plane)
      end

      it 'raises error if plane not at the airport' do
        expect{subject.request_take_off taking_off_plane}.to raise_error "take off request denied, Plane is not at this airport"
      end
    end
end


#   describe 'take off' do
#     xit 'instructs a plane to take off'

#     xit 'releases a plane'
#   end

#   describe 'landing' do
#     xit 'instructs a plane to land'

#     xit 'receives a plane'
#   end

#   describe 'traffic control' do
#     context 'when airport is full' do
#       xit 'does not allow a plane to land'
#     end

#     Include a weather condition.
#     The weather must be random and only have two states "sunny" or "stormy".
#     Try and take off a plane, but if the weather is stormy,
#     the plane can not take off and must remain in the airport.

#     This will require stubbing to stop the random return of the weather.
#     If the airport has a weather condition of stormy,
#     the plane can not land, and must not be in the airport

#     context 'when weather conditions are stormy' do
#       xit 'does not allow a plane to take off'

#       xit 'does not allow a plane to land'
#     end
#   end
# end
