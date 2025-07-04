
build:
	docker build --progress=plain -t fortran-lambda:latest .

test:
	#   x1 + 3*x2 =  7
	# 2*x2 + 4*x2 = 10
	docker run -it --rm fortran-lambda:latest linear_eq '{"a": [[1,2],[3,4]], "b":[7,10]}'
