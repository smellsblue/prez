require "erb"

module Prez
  module Builder
    include Prez::Helpers

    private

    def build_html(filename)
      say "Generating html..."
      reset_helpers!
      @_slide_contents = erb_eval filename
      erb_eval File.expand_path("../../../templates/build.html.tt", __FILE__)
    end

    def erb_eval(template)
      ERB.new(File.read(template), nil, "-", "@output_buffer").result(binding)
    end
  end
end
