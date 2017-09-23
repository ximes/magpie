module Atoms::Value
  class Image < Atoms::Base
    def execute(job, rule, context)
      img_result = "Img: " + context[:src] || nil
      job.result_contents << img_result
      img_result
    rescue
      nil
    end
  end
end
