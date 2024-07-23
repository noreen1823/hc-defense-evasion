# Steganography

## Credits

Much thanks to the [original author](https://github.com/kelvins/steganography/tree/main) of the code for providing us with the necessary tools

## Hiding image inside another image using LSB

Hide image 2 inside image 1
```bash
python msb.py merge --image1=img/hacking.jpg --image2=img/usd.jpg --output=img/msb_output.png
```
Restore original

```bash
python msb.py unmerge --image=img/msb_output.png --output=img/msb_output2.png
```
