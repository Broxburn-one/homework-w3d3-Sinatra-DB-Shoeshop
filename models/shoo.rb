 require('pg')
 class Shoo 
  attr_reader(:style, :first_name, :last_name, :address, :city, :size, :quantity)
  def initialize(options)
    @style = options["style"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @address = options['address']
    @city = options['city']
    @size = options['size']
    @quantity = options['quantity'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def total_price()
    return @quantity * 150
  end

 def save()
    db = PG.connect({ dbname: 'shoo_shop', host: 'localhost' })
    sql = "INSERT INTO shoos (
      first_name, 
      last_name,
      address,
      city,
      style,
      quantity ) VALUES (
      '#{ @first_name}',
      '#{@last_name}',
      '#{@address}',
      '#{@city}',
      '#{@style}',
      #{@quantity}   
      )"

      db.exec( sql )
      db.close
  end

def self.all()
    db = PG.connect({dbname: 'shoo_shop', host: 'localhost'})
    sql = "SELECT * FROM shoos"  
    shoos = db.exec( sql )
    result = shoos.map { |shoo| Shoo.new(shoo) }
    db.close()
    return result

  end


end