# -*- encoding: utf-8 -*-

class Dice(object):

	def __init__(self):
		self.t = 1
		self.n = 2
		self.w = 3

	def N(self):
		nt = self.t
		self.t = self.__ura(self.n)
		self.n = nt

	def S(self):
		st = self.t
		self.t = self.n
		self.n = self.__ura(st)

	def E(self):
		wt = self.t
		self.t = self.w
		self.w = self.__ura(wt)

	def W(self):
		et = self.t
		self.t = self.__ura(self.w)
		self.w = self.t

	def __ura(self, n):
		return 7 - n

def main(seq):
	dice = Dice()
	def tambling_dice(way):
		getattr(dice, way)()
		return dice.t

	return "".join(str(tambling_dice(w)) for w in seq)

print(main("EEEE"))
