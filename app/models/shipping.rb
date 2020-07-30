class Shipping < ActiveHash::Base
  self.data = [
    {id: 1, name: '1~2日'}, {id: 2, name: '2~3日'}, {id: 3, name: '3~4日'}, 
    {id: 4, name: '4~5日'}, {id: 5, name: '一週間以上'}, 
  ]
end