# List available recipes
default:
    @just --list

# Compile cv.typ to cv.pdf
build:
    typst compile cv.typ

# Recompile on every change and open the PDF viewer
watch:
    typst watch cv.typ --open

# Remove the generated PDF
clean:
    rm -f cv.pdf
