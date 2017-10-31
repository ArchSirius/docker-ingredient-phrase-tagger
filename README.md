# CRF Ingredient Phrase Tagger
This is a Docker-contained version of NYTimes' [ingredient-phrase-tagger](https://github.com/NYTimes/ingredient-phrase-tagger), for the parsing function.
It acts as a pre-packaged wrapper to use the tool more easily. For more details on the tool itself, please refer to the original documentation (link above).

Given the following input:
```
1 pound carrots, young ones if possible
Kosher salt, to taste
2 tablespoons sherry vinegar
2 tablespoons honey
2 tablespoons extra-virgin olive oil
1 medium-size shallot, peeled and finely diced
1/2 teaspoon fresh thyme leaves, finely chopped
Black pepper, to taste
```
It produces something like:
```
[
    {
        "qty":     "1",
        "unit":    "pound"
        "name":    "carrots",
        "other":   ",",
        "comment": "young ones if possible",
        "input":   "1 pound carrots, young ones if possible",
        "display": "<span class='qty'>1</span><span class='unit'>pound</span><span class='name'>carrots</span><span class='other'>,</span><span class='comment'>young ones if possible< /span>",
    },
    ...
]
```

## Usage
To start, use, then remove the container once done, simply execute the following command, assuming `input.txt` contains a list of ingredients, one per line.
```
$ docker run -i --rm archsirius/ingredient-phrase-tagger < input.txt
```
You can also pipe output directly.
```
$ cat input.txt | docker run -i --rm archsirius/ingredient-phrase-tagger
$ echo "1 cup milk" | docker run -i --rm archsirius/ingredient-phrase-tagger
```
Results will be sent to STDOUT, so it can easily be written to any file, or piped to another program.
```
$ docker run -i --rm archsirius/ingredient-phrase-tagger < input.txt > output.json
```
The `-i` option is required to read from STDIN. The `--rm` option is optional but useful to remove the container once the job is completed, since it is not daemonized.

It may take a few moments for results to appear with large input, as the original tool uses intermediate files and waits to tag all the input data before writing to the output CRF++ file, then converting it to JSON.

## License
[Apache 2.0](LICENSE.md).
