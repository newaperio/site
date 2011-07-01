class CodeFormatter
  def initialize(text)
    @text = text
  end

  def to_html
    text = @text.clone
    codes = []
    text.gsub!(/^``` ?(.*?)\r?\n(.+?)\r?\n```\r?$/m) do |match|
      code = { :id => "CODE#{codes.size}ENDCODE", :name => ($1.empty? ? nil : $1), :content => $2 }
      codes << code
      "\n\n#{code[:id]}\n\n"
    end
    html = Redcarpet.new(text, :filter_html, :hard_wrap, :autolink, :smart).to_html
    codes.each do |code|
      html.sub!("<p>#{code[:id]}</p>") do
        <<-EOS
          <div class="code_block">
            #{CodeRay.scan(code[:content], language(code[:name])).div(:css => :class)}
          </div>
        EOS
      end
    end
    html
  end
  
  def language(path)
    case path
    when /\.yml$/ then "yaml"
    when /\.js$/ then "java_script"
    when /\.erb$/, /\.html$/ then "rhtml"
    when /\.rb$/, /\.rake$/, /\.gemspec/, /file$/, /console$/ then "ruby"
    when /\./ then path[/\.([^.]+?)$/, 1]
    else path
    end
  end
  
end