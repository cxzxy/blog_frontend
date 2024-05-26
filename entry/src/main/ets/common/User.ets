class User {
  name : string
  image : ResourceStr
  price : number
  discount : number
  constructor(name:string, image:ResourceStr, price:number, discount:number=0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}