require 'ruwattics'

RSpec.describe SimpleMeasurement do
  context "with correct attributes" do
    it "should have have an id attribute" do
      sm = SimpleMeasurement.new
      sm.id = "meter-101"
      expect(sm).to have_attributes(id: "meter-101")
    end

    it "should have have an timestamp attribute" do
      sm = SimpleMeasurement.new
      sm.setTime = "2017-11-15T23:00:49.420-02:00"
      expect(sm).to have_attributes(timestamp: "2017-11-15T23:00:49.420-02:00")
    end

    it "should have have an value attribute" do
      sm = SimpleMeasurement.new
      sm.value = rand*100
      expect(sm).to have_attributes(value: sm.value)
    end

  end

  context "works with valid inputs" do
    it "should be a string for id" do
      sm = SimpleMeasurement.new
      sm.id = 'meter-101'
      expect(sm.id).to be_a(String)
    end

    it "should be string for date" do
      sm = SimpleMeasurement.new
      sm.setTime = "2017-11-15T23:00:49.420-02:00"
      expect(sm.timestamp).to be_a(String)
    end

    it "should be a numberic for value" do
      sm = SimpleMeasurement.new
      sm.value = rand*100
      expect(sm.value).to be_an(Numeric)
    end
  end

  context "with setTimeNow valid with ISO8601" do
    it "should return valid date with ISO8601" do
      sm = SimpleMeasurement.new
      sm.setTimeNow
      expect(!!(sm.timestamp =~ /(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}).(\d{3})-(\d{2}):(\d{2})/)).to be true

    end
  end

  context "with payload output" do
    it "should return a hash" do
      sm = SimpleMeasurement.new
      sm.id = "meter-101"
      sm.setTimeNow
      sm.value = rand*1000
      expect(sm.payload).to include(id: "meter-101", tsISO8601: sm.timestamp, value: sm.value)
    end
  end
end


RSpec.describe ElectricityMeasurement do
  context "with correct attributes" do
    it "should have have all all attributes" do
      em = ElectricityMeasurement.new
      em.id = "meter-101"
      em.timestamp = '2017-11-15T23:00:49.420-02:00'
      em.activePowerPhaseA = rand*100
      em.activePowerPhaseB = rand*100
      em.activePowerPhaseC = rand*100
      em.reactivePowerPhaseA = rand*100
      em.reactivePowerPhaseB = rand*100
      em.reactivePowerPhaseC = rand*100
      em.apparentPowerPhaseA = rand*100
      em.apparentPowerPhaseB = rand*100
      em.apparentPowerPhaseC = rand*100
      em.voltagePhaseA = rand*100
      em.voltagePhaseB = rand*100
      em.voltagePhaseC = rand*100
      em.currentPhaseA = rand*100
      em.currentPhaseB = rand*100
      em.currentPhaseC = rand*100
      em.activeEnergyPhaseA = rand*100
      em.activeEnergyPhaseB = rand*100
      em.activeEnergyPhaseC = rand*100
      em.lineToLineVoltagePhaseAB = rand*100
      em.lineToLineVoltagePhaseBC = rand*100
      em.lineToLineVoltagePhaseAC = rand*100
      expect(em).to have_attributes(id: "meter-101", timestamp: '2017-11-15T23:00:49.420-02:00', activePowerPhaseA: em.activePowerPhaseA,
                                    activePowerPhaseB: em.activePowerPhaseB, activePowerPhaseC:em.activePowerPhaseC, reactivePowerPhaseA: em.reactivePowerPhaseA,
                                    reactivePowerPhaseB: em.reactivePowerPhaseB, reactivePowerPhaseC: em.reactivePowerPhaseC,
                                    apparentPowerPhaseA: em.apparentPowerPhaseA, apparentPowerPhaseB: em.apparentPowerPhaseB,
                                    apparentPowerPhaseC: em.apparentPowerPhaseC, voltagePhaseA: em.voltagePhaseA, voltagePhaseB: em.voltagePhaseB,
                                    voltagePhaseC: em.voltagePhaseC, currentPhaseA: em.currentPhaseA, currentPhaseB: em.currentPhaseB,
                                    currentPhaseC: em.currentPhaseC, activeEnergyPhaseA: em.activeEnergyPhaseA, activeEnergyPhaseB: em.activeEnergyPhaseB,
                                    activeEnergyPhaseC: em.activeEnergyPhaseC, lineToLineVoltagePhaseAB: em.lineToLineVoltagePhaseAB,
                                    lineToLineVoltagePhaseAC: em.lineToLineVoltagePhaseAC, lineToLineVoltagePhaseBC: em.lineToLineVoltagePhaseBC)
    end
  end

  context "works with valid inputs" do
    it "should be a string for id and timestamp and numberic for electric mesuaments" do
      em = ElectricityMeasurement.new
      em.id = "meter-101"
      em.timestamp = '2017-11-15T23:00:49.420-02:00'
      em.activePowerPhaseA = rand*100
      em.activePowerPhaseB = rand*100
      em.activePowerPhaseC = rand*100
      em.reactivePowerPhaseA = rand*100
      em.reactivePowerPhaseB = rand*100
      em.reactivePowerPhaseC = rand*100
      em.apparentPowerPhaseA = rand*100
      em.apparentPowerPhaseB = rand*100
      em.apparentPowerPhaseC = rand*100
      em.voltagePhaseA = rand*100
      em.voltagePhaseB = rand*100
      em.voltagePhaseC = rand*100
      em.currentPhaseA = rand*100
      em.currentPhaseB = rand*100
      em.currentPhaseC = rand*100
      em.activeEnergyPhaseA = rand*100
      em.activeEnergyPhaseB = rand*100
      em.activeEnergyPhaseC = rand*100
      em.lineToLineVoltagePhaseAB = rand*100
      em.lineToLineVoltagePhaseBC = rand*100
      em.lineToLineVoltagePhaseAC = rand*100
      expect(em.id).to be_a(String)
      expect(em.timestamp).to be_a(String)
      expect(em.activePowerPhaseA).to be_an(Numeric)
      expect(em.activePowerPhaseB).to be_an(Numeric)
      expect(em.activePowerPhaseC).to be_an(Numeric)
      expect(em.reactivePowerPhaseA).to be_an(Numeric)
      expect(em.reactivePowerPhaseB).to be_an(Numeric)
      expect(em.reactivePowerPhaseC).to be_an(Numeric)
      expect(em.apparentPowerPhaseA).to be_an(Numeric)
      expect(em.apparentPowerPhaseB).to be_an(Numeric)
      expect(em.apparentPowerPhaseC).to be_an(Numeric)
      expect(em.voltagePhaseA).to be_an(Numeric)
      expect(em.voltagePhaseB).to be_an(Numeric)
      expect(em.voltagePhaseC).to be_an(Numeric)
      expect(em.currentPhaseA).to be_an(Numeric)
      expect(em.currentPhaseB).to be_an(Numeric)
      expect(em.currentPhaseC).to be_an(Numeric)
      expect(em.activeEnergyPhaseA).to be_an(Numeric)
      expect(em.activeEnergyPhaseB).to be_an(Numeric)
      expect(em.activeEnergyPhaseC).to be_an(Numeric)
      expect(em.lineToLineVoltagePhaseAB).to be_an(Numeric)
      expect(em.lineToLineVoltagePhaseAC).to be_an(Numeric)
      expect(em.lineToLineVoltagePhaseBC).to be_an(Numeric)
    end
  end

  context "with setTimeNow valid with ISO8601" do
    it "should return valid date with ISO8601" do
      em = ElectricityMeasurement.new
      em.setTimeNow
      expect(!!(em.timestamp =~ /(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}).(\d{3})-(\d{2}):(\d{2})/)).to be true

    end
  end

  context "with payload output" do
    it "should return a hash" do
      em = ElectricityMeasurement.new
      em.id = "meter-101"
      em.setTimeNow
      em.activePowerPhaseA = rand*100
      em.activePowerPhaseB = rand*100
      em.activePowerPhaseC = rand*100
      em.reactivePowerPhaseA = rand*100
      em.reactivePowerPhaseB = rand*100
      em.reactivePowerPhaseC = rand*100
      em.apparentPowerPhaseA = rand*100
      em.apparentPowerPhaseB = rand*100
      em.apparentPowerPhaseC = rand*100
      em.voltagePhaseA = rand*100
      em.voltagePhaseB = rand*100
      em.voltagePhaseC = rand*100
      em.currentPhaseA = rand*100
      em.currentPhaseB = rand*100
      em.currentPhaseC = rand*100
      em.activeEnergyPhaseA = rand*100
      em.activeEnergyPhaseB = rand*100
      em.activeEnergyPhaseC = rand*100
      em.lineToLineVoltagePhaseAB = rand*100
      em.lineToLineVoltagePhaseAC = rand*100
      em.lineToLineVoltagePhaseBC = rand*100
      expect(em.payload).to include(id: "meter-101", tsISO8601: em.timestamp, aP_1: em.activePowerPhaseA,
                                    aP_2: em.activePowerPhaseB, aP_3:em.activePowerPhaseC, rP_1: em.reactivePowerPhaseA,
                                    rP_2: em.reactivePowerPhaseB, rP_3: em.reactivePowerPhaseC,
                                    apP_1: em.apparentPowerPhaseA, apP_2: em.apparentPowerPhaseB,
                                    apP_3: em.apparentPowerPhaseC, v_1: em.voltagePhaseA, v_2: em.voltagePhaseB,
                                    v_3: em.voltagePhaseC, c_1: em.currentPhaseA, c_2: em.currentPhaseB,
                                    c_3: em.currentPhaseC, pC_1: em.activeEnergyPhaseA, pC_2: em.activeEnergyPhaseB,
                                    pC_3: em.activeEnergyPhaseC, v_12: em.lineToLineVoltagePhaseAB,
                                    v_13: em.lineToLineVoltagePhaseAC, v_23: em.lineToLineVoltagePhaseBC )
    end
  end
end


RSpec.describe User do
  context "with correct attributes" do
    it "should have have an username, password and url" do
      u = User.new(:DEVELOPMENT, 'username', 'password')
      expect(u).to have_attributes(username: 'username', password: 'password', url: 'https://dev-web-collector.wattics.com/measurements/v2/unifiedjson/')
    end
  end
end

RSpec.describe Sender do
  context "with sending simple measurements" do
    it "should return 200 when sending a simple measurement" do
      sm = SimpleMeasurement.new
      sm.id = "meter-101"
      sm.setTimeNow
      sm.value = rand*100
      u = User.new(:DEVELOPMENT, 'username', 'password')
      expect(Sender.send(sm, u)).to be_equal 200
    end

    it "should return 200 when sending a 100 simple measurements" do
      sm = SimpleMeasurement.new
      sm.id = "meter-101"
      100.times {
        sm.setTimeNow
        sm.value = rand*100
        u = User.new(:DEVELOPMENT, 'username', 'password')
        expect(Sender.send(sm, u)).to be_equal 200
      }
    end
  end
end
