#John Ming Ngo, V1.0.0, Last Change 2016-10-4
#UCalgary ID 30020834, Tutorial Number T11
#This program calculates the final sale price of a given product.
print("What is the price of your item?") 
stickerPrice= float(input("$"))
if stickerPrice >= 100000:
    discountPrice = stickerPrice * 0.97
else:
    discountPrice = stickerPrice
gst = discountPrice * 0.05
salePrice = discountPrice + gst
print("Sticker Price:          %s%9.2f" % ("$ ", stickerPrice))
if discountPrice < stickerPrice:
    print("Discounted Price (-3%%): %s%9.2f" % ("$ ", discountPrice))
print("GST (+5%%):              %s%9.2f" % ("$ ", gst))
print("Sale price:             %s%9.2f" % ("$ ", salePrice))
