class Jobs::Status
  class Failed < Jobs::Status
    def to_s
      "Failed"
    end
  end
  class Successful < Jobs::Status
    def to_s
      "Successful"
    end
  end
  class Timeout < Jobs::Status
    def to_s
      "Timed out"
    end
  end
end
