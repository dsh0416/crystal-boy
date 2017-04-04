task 'compile' do
  sh 'crystal build -o ./build/crystal-boy main.cr --release'
end

task 'run' do
  sh 'crystal build -o ./build/crystal-boy main.cr'
  sh './build/crystal-boy'
end
