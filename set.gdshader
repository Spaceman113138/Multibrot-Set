shader_type canvas_item;

global uniform float power;
global uniform vec2 xRange;
global uniform vec2 yRange;
global uniform float cutoff;
global uniform float maxItter;
global uniform vec2 offset;

const vec4[256] colors = {
vec4(0.002,0.058,0.364,1.0),
vec4(0.002,0.06,0.37,1.0),
vec4(0.003,0.062,0.377,1.0),
vec4(0.004,0.064,0.383,1.0),
vec4(0.006,0.065,0.39,1.0),
vec4(0.008,0.067,0.396,1.0),
vec4(0.01,0.069,0.402,1.0),
vec4(0.013,0.071,0.409,1.0),
vec4(0.016,0.072,0.415,1.0),
vec4(0.019,0.074,0.421,1.0),
vec4(0.023,0.076,0.427,1.0),
vec4(0.028,0.077,0.433,1.0),
vec4(0.033,0.079,0.439,1.0),
vec4(0.039,0.081,0.445,1.0),
vec4(0.045,0.082,0.451,1.0),
vec4(0.052,0.084,0.457,1.0),
vec4(0.058,0.085,0.463,1.0),
vec4(0.065,0.087,0.468,1.0),
vec4(0.071,0.088,0.474,1.0),
vec4(0.078,0.089,0.48,1.0),
vec4(0.085,0.091,0.485,1.0),
vec4(0.092,0.092,0.49,1.0),
vec4(0.099,0.093,0.496,1.0),
vec4(0.107,0.095,0.501,1.0),
vec4(0.114,0.096,0.506,1.0),
vec4(0.122,0.097,0.511,1.0),
vec4(0.129,0.098,0.516,1.0),
vec4(0.137,0.099,0.52,1.0),
vec4(0.145,0.1,0.525,1.0),
vec4(0.153,0.101,0.529,1.0),
vec4(0.162,0.102,0.534,1.0),
vec4(0.17,0.102,0.538,1.0),
vec4(0.178,0.103,0.542,1.0),
vec4(0.187,0.104,0.546,1.0),
vec4(0.196,0.104,0.549,1.0),
vec4(0.205,0.104,0.553,1.0),
vec4(0.214,0.105,0.556,1.0),
vec4(0.224,0.105,0.559,1.0),
vec4(0.233,0.105,0.562,1.0),
vec4(0.243,0.105,0.564,1.0),
vec4(0.253,0.104,0.566,1.0),
vec4(0.263,0.104,0.568,1.0),
vec4(0.273,0.103,0.57,1.0),
vec4(0.284,0.102,0.571,1.0),
vec4(0.295,0.101,0.572,1.0),
vec4(0.306,0.1,0.573,1.0),
vec4(0.317,0.098,0.573,1.0),
vec4(0.328,0.097,0.573,1.0),
vec4(0.339,0.095,0.574,1.0),
vec4(0.35,0.093,0.574,1.0),
vec4(0.36,0.092,0.574,1.0),
vec4(0.37,0.09,0.574,1.0),
vec4(0.38,0.088,0.574,1.0),
vec4(0.39,0.087,0.573,1.0),
vec4(0.399,0.085,0.573,1.0),
vec4(0.409,0.083,0.573,1.0),
vec4(0.418,0.081,0.573,1.0),
vec4(0.428,0.079,0.572,1.0),
vec4(0.437,0.077,0.572,1.0),
vec4(0.446,0.075,0.572,1.0),
vec4(0.455,0.074,0.571,1.0),
vec4(0.464,0.072,0.57,1.0),
vec4(0.473,0.07,0.57,1.0),
vec4(0.481,0.068,0.569,1.0),
vec4(0.49,0.066,0.568,1.0),
vec4(0.499,0.064,0.568,1.0),
vec4(0.507,0.062,0.567,1.0),
vec4(0.515,0.06,0.566,1.0),
vec4(0.524,0.058,0.565,1.0),
vec4(0.532,0.056,0.564,1.0),
vec4(0.54,0.054,0.563,1.0),
vec4(0.548,0.052,0.562,1.0),
vec4(0.556,0.051,0.56,1.0),
vec4(0.564,0.049,0.559,1.0),
vec4(0.572,0.048,0.558,1.0),
vec4(0.58,0.046,0.556,1.0),
vec4(0.588,0.045,0.555,1.0),
vec4(0.596,0.043,0.554,1.0),
vec4(0.603,0.042,0.552,1.0),
vec4(0.611,0.041,0.551,1.0),
vec4(0.619,0.04,0.549,1.0),
vec4(0.626,0.039,0.548,1.0),
vec4(0.634,0.038,0.546,1.0),
vec4(0.641,0.038,0.545,1.0),
vec4(0.648,0.037,0.543,1.0),
vec4(0.656,0.037,0.542,1.0),
vec4(0.663,0.037,0.54,1.0),
vec4(0.67,0.037,0.538,1.0),
vec4(0.677,0.037,0.537,1.0),
vec4(0.684,0.037,0.535,1.0),
vec4(0.691,0.038,0.534,1.0),
vec4(0.698,0.039,0.532,1.0),
vec4(0.705,0.04,0.53,1.0),
vec4(0.712,0.041,0.529,1.0),
vec4(0.719,0.042,0.527,1.0),
vec4(0.726,0.044,0.525,1.0),
vec4(0.733,0.045,0.523,1.0),
vec4(0.739,0.047,0.522,1.0),
vec4(0.746,0.049,0.52,1.0),
vec4(0.753,0.051,0.518,1.0),
vec4(0.759,0.054,0.516,1.0),
vec4(0.766,0.056,0.514,1.0),
vec4(0.772,0.059,0.513,1.0),
vec4(0.779,0.061,0.511,1.0),
vec4(0.785,0.064,0.509,1.0),
vec4(0.792,0.067,0.507,1.0),
vec4(0.798,0.07,0.505,1.0),
vec4(0.804,0.074,0.503,1.0),
vec4(0.811,0.078,0.501,1.0),
vec4(0.817,0.082,0.499,1.0),
vec4(0.823,0.087,0.496,1.0),
vec4(0.828,0.092,0.494,1.0),
vec4(0.834,0.097,0.492,1.0),
vec4(0.84,0.103,0.489,1.0),
vec4(0.845,0.108,0.487,1.0),
vec4(0.85,0.114,0.484,1.0),
vec4(0.856,0.12,0.481,1.0),
vec4(0.861,0.126,0.478,1.0),
vec4(0.866,0.133,0.475,1.0),
vec4(0.871,0.139,0.472,1.0),
vec4(0.876,0.146,0.469,1.0),
vec4(0.88,0.152,0.466,1.0),
vec4(0.885,0.159,0.463,1.0),
vec4(0.889,0.166,0.46,1.0),
vec4(0.894,0.173,0.456,1.0),
vec4(0.898,0.18,0.453,1.0),
vec4(0.902,0.187,0.449,1.0),
vec4(0.906,0.194,0.445,1.0),
vec4(0.91,0.201,0.441,1.0),
vec4(0.914,0.208,0.438,1.0),
vec4(0.918,0.215,0.434,1.0),
vec4(0.921,0.223,0.429,1.0),
vec4(0.924,0.23,0.425,1.0),
vec4(0.928,0.237,0.421,1.0),
vec4(0.931,0.245,0.417,1.0),
vec4(0.934,0.252,0.412,1.0),
vec4(0.937,0.259,0.408,1.0),
vec4(0.94,0.267,0.403,1.0),
vec4(0.943,0.274,0.399,1.0),
vec4(0.945,0.281,0.394,1.0),
vec4(0.948,0.289,0.39,1.0),
vec4(0.95,0.296,0.386,1.0),
vec4(0.952,0.303,0.382,1.0),
vec4(0.955,0.311,0.378,1.0),
vec4(0.957,0.318,0.374,1.0),
vec4(0.959,0.325,0.37,1.0),
vec4(0.961,0.333,0.366,1.0),
vec4(0.962,0.34,0.363,1.0),
vec4(0.964,0.347,0.359,1.0),
vec4(0.966,0.354,0.355,1.0),
vec4(0.967,0.361,0.352,1.0),
vec4(0.968,0.369,0.348,1.0),
vec4(0.97,0.376,0.345,1.0),
vec4(0.971,0.383,0.341,1.0),
vec4(0.972,0.39,0.338,1.0),
vec4(0.973,0.398,0.335,1.0),
vec4(0.974,0.405,0.332,1.0),
vec4(0.974,0.412,0.329,1.0),
vec4(0.975,0.419,0.325,1.0),
vec4(0.975,0.426,0.323,1.0),
vec4(0.976,0.434,0.32,1.0),
vec4(0.976,0.441,0.317,1.0),
vec4(0.976,0.448,0.314,1.0),
vec4(0.976,0.455,0.311,1.0),
vec4(0.976,0.462,0.309,1.0),
vec4(0.976,0.469,0.306,1.0),
vec4(0.976,0.477,0.304,1.0),
vec4(0.976,0.484,0.301,1.0),
vec4(0.976,0.491,0.299,1.0),
vec4(0.976,0.497,0.296,1.0),
vec4(0.976,0.504,0.294,1.0),
vec4(0.976,0.511,0.291,1.0),
vec4(0.976,0.517,0.289,1.0),
vec4(0.976,0.524,0.286,1.0),
vec4(0.976,0.53,0.284,1.0),
vec4(0.976,0.537,0.281,1.0),
vec4(0.976,0.543,0.278,1.0),
vec4(0.976,0.549,0.276,1.0),
vec4(0.976,0.555,0.273,1.0),
vec4(0.976,0.562,0.271,1.0),
vec4(0.977,0.568,0.268,1.0),
vec4(0.977,0.574,0.266,1.0),
vec4(0.977,0.58,0.263,1.0),
vec4(0.978,0.585,0.261,1.0),
vec4(0.978,0.591,0.258,1.0),
vec4(0.979,0.597,0.256,1.0),
vec4(0.979,0.603,0.253,1.0),
vec4(0.98,0.609,0.25,1.0),
vec4(0.98,0.614,0.248,1.0),
vec4(0.981,0.62,0.245,1.0),
vec4(0.981,0.625,0.243,1.0),
vec4(0.982,0.631,0.24,1.0),
vec4(0.983,0.636,0.238,1.0),
vec4(0.983,0.642,0.235,1.0),
vec4(0.984,0.647,0.232,1.0),
vec4(0.985,0.653,0.23,1.0),
vec4(0.986,0.658,0.227,1.0),
vec4(0.987,0.663,0.225,1.0),
vec4(0.987,0.669,0.224,1.0),
vec4(0.988,0.674,0.222,1.0),
vec4(0.988,0.68,0.221,1.0),
vec4(0.989,0.685,0.22,1.0),
vec4(0.989,0.69,0.22,1.0),
vec4(0.989,0.696,0.219,1.0),
vec4(0.99,0.701,0.219,1.0),
vec4(0.99,0.707,0.218,1.0),
vec4(0.99,0.712,0.218,1.0),
vec4(0.99,0.718,0.218,1.0),
vec4(0.99,0.723,0.219,1.0),
vec4(0.99,0.728,0.219,1.0),
vec4(0.991,0.734,0.219,1.0),
vec4(0.991,0.739,0.22,1.0),
vec4(0.991,0.745,0.221,1.0),
vec4(0.99,0.75,0.221,1.0),
vec4(0.99,0.755,0.222,1.0),
vec4(0.99,0.761,0.223,1.0),
vec4(0.99,0.766,0.224,1.0),
vec4(0.99,0.772,0.225,1.0),
vec4(0.99,0.777,0.226,1.0),
vec4(0.99,0.783,0.228,1.0),
vec4(0.989,0.788,0.229,1.0),
vec4(0.989,0.793,0.23,1.0),
vec4(0.989,0.799,0.232,1.0),
vec4(0.988,0.804,0.233,1.0),
vec4(0.988,0.81,0.235,1.0),
vec4(0.987,0.815,0.237,1.0),
vec4(0.987,0.82,0.238,1.0),
vec4(0.987,0.826,0.24,1.0),
vec4(0.986,0.831,0.242,1.0),
vec4(0.986,0.836,0.244,1.0),
vec4(0.985,0.842,0.245,1.0),
vec4(0.984,0.847,0.247,1.0),
vec4(0.984,0.853,0.249,1.0),
vec4(0.983,0.858,0.251,1.0),
vec4(0.983,0.863,0.254,1.0),
vec4(0.982,0.869,0.256,1.0),
vec4(0.981,0.874,0.258,1.0),
vec4(0.98,0.879,0.26,1.0),
vec4(0.98,0.885,0.262,1.0),
vec4(0.979,0.89,0.264,1.0),
vec4(0.978,0.895,0.267,1.0),
vec4(0.977,0.901,0.269,1.0),
vec4(0.976,0.906,0.271,1.0),
vec4(0.975,0.912,0.274,1.0),
vec4(0.974,0.917,0.276,1.0),
vec4(0.973,0.922,0.279,1.0),
vec4(0.972,0.928,0.281,1.0),
vec4(0.971,0.933,0.284,1.0),
vec4(0.97,0.938,0.286,1.0),
vec4(0.969,0.944,0.289,1.0),
vec4(0.968,0.949,0.291,1.0),
vec4(0.967,0.954,0.294,1.0),
vec4(0.966,0.96,0.297,1.0),
vec4(0.964,0.965,0.299,1.0),
vec4(0.963,0.97,0.302,1.0),
vec4(0.0, 0.0, 0.0 ,1.0)
};

float roundDec(float num, float digit) {
	return round(num * pow(10.0, digit)) / pow(10.0, digit);
}

vec2 roundVec(vec2 value, float digit) {
	return vec2(roundDec(value.x, digit), roundDec(value.y, digit));
}

float absolute(vec2 value) {
	return sqrt(pow(value.x,2) + pow(value.y, 2));
}

vec2 complexPower(vec2 value, float _power) {
	float r = absolute(value);
	float angle = atan(value.y, value.x);
	float real = pow(r, _power) * cos(angle * _power);
	float imag = pow(r, _power) * sin(angle * _power);

	return vec2(real, imag);
}

float itterate(vec2 value) {
	float x = 0.0;
	vec2 z = vec2(0,0);
	while (x < maxItter) {
		x += 1.0;
		if (absolute(z) > cutoff) {
			return x;
		} else {
			z = complexPower(z,power) + value;
			z = roundVec(z, 14.0);
		}
	}
	return x;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float xCord = (xRange.y - xRange.x) * UV.x + xRange.x;
	float yCord = (yRange.y - yRange.x) * -UV.y - yRange.x;
	vec2 position = vec2(xCord, yCord) + offset;
	float value = round(itterate(position) * 255.0 / maxItter);
	vec4 color = colors[int(value)];
	COLOR = color;
}


//z = z**power + c



//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
