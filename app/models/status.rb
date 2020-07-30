class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: '新品'}, {id: 2, name: '未使用に近い'}, {id: 3, name: '目立った傷等はない'}, 
    {id: 4, name: '軽い傷がある'}, {id: 5, name: '汚れがある'}, {id: 6, name: 'かなり汚れている'}
  ]
end