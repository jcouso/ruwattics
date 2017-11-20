require 'rest-client'
require 'thread'
require 'json'
require 'time'

class User
  #This class sets-up user's enviorment and credentials
  attr_accessor :username, :password
  attr_reader :url
  def initialize(type, username, password)
    @username = username
    @password = password

    if type == :DEVELOPMENT
      @url = 'https://dev-web-collector.wattics.com/measurements/v2/unifiedjson/'
    elsif type == :PRODUCTION
      @url = 'https://web-collector.wattics.com/measurements/v2/unifiedjson/'
    end
  end
end

class Sender
  #this class send the data over, it will either return with "200" as successful or the error response recieved from the server
  def initialize(measurement, user)
    @measurement = measurement
    @user = user
  end

  def sender
    begin
      response = RestClient::Request.execute(method: :post, url: @user.url,
                          user: @user.username, password: @user.password,
                          payload: @measurement.payload.to_json
        )
      puts @measurement.payload.to_json
      puts response.code
      response.code
    rescue RestClient::ExceptionWithResponse => e
      puts e.response
      puts "Error in sending request"
    end
  end
end

class Worker
  def initialize(queue)
    @thread = Thread.new { poll(queue) }
  end

  def poll(queue)
    until done?
      begin
        queue.pop(true).call
      rescue ThreadError
        # queue was empty
        sleep 1
      end
    end
    exit 0
  end

  def done?
    @done
  end

  def shut_down
    @done = true
  end
end

class Agent
  @queue = Queue.new
  @workers = []
  50.times do
    @workers << Worker.new(@queue)
  end

  def self.send(measurement, user)
    data = Sender.new(measurement, user)
    @queue << Proc.new { data.sender }
     sleep 0.001 until @queue.empty?
  end
end


class SimpleMeasurement
  #This class handles the simple measuarement values, it has a setTimeNow function to set the current time.
  #payload returns a hash in a correct manner, excluding empty atributes
  attr_accessor :id, :timestamp, :value
  def setTimeNow
    @timestamp = Time.now.strftime("%Y-%m-%dT%H:%M:%S.%L%:z")
  end

  def setTime=(time)
    @timestamp = time
  end

  def payload
    {
                id: @id.to_s,
                tsISO8601: @timestamp,
                value: @value
    }.select {|k, v| v }
  end

end


class ElectricityMeasurement
  #This class handles the eletric measurement values, it has a setTimeNow function to set the current time.
  #payload returns a hash in a correct manner, excluding empty atributes
  attr_accessor :id, :timestamp, :activePowerPhaseA, :activePowerPhaseB,
                  :activePowerPhaseC, :reactivePowerPhaseA, :reactivePowerPhaseB,
                  :reactivePowerPhaseC, :apparentPowerPhaseA, :apparentPowerPhaseB,
                  :apparentPowerPhaseC, :voltagePhaseA, :voltagePhaseB, :voltagePhaseC,
                  :currentPhaseA, :currentPhaseB, :currentPhaseC, :activeEnergyPhaseA,
                  :activeEnergyPhaseB, :activeEnergyPhaseC, :lineToLineVoltagePhaseAB,
                  :lineToLineVoltagePhaseAC, :lineToLineVoltagePhaseBC

  def setTimeNow
    @timestamp = Time.now.strftime("%Y-%m-%dT%H:%M:%S.%L%:z")
  end

  def setTime=(time)
    @timestamp = time
  end

  def payload
        {
            id: @id.to_s,
            tsISO8601: @timestamp,
            aP_1: @activePowerPhaseA,
            aP_2: @activePowerPhaseB,
            aP_3: @activePowerPhaseC,
            rP_1: @reactivePowerPhaseA,
            rP_2: @reactivePowerPhaseB,
            rP_3: @reactivePowerPhaseC,
            apP_1: @apparentPowerPhaseA,
            apP_2: @apparentPowerPhaseB,
            apP_3: @apparentPowerPhaseC,
            v_1: @voltagePhaseA,
            v_2: @voltagePhaseB,
            v_3: @voltagePhaseC,
            c_1: @currentPhaseA,
            c_2: @currentPhaseB,
            c_3: @currentPhaseC,
            pC_1: @activeEnergyPhaseA,
            pC_2: @activeEnergyPhaseB,
            pC_3: @activeEnergyPhaseC,
            v_12: @lineToLineVoltagePhaseAB,
            v_13: @lineToLineVoltagePhaseAC,
            v_23: @lineToLineVoltagePhaseBC
        }.select {|k, v| v }
  end
end
