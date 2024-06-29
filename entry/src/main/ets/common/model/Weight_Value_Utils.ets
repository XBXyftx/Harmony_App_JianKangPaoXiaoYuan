export function valueToWeight(value: number): FontWeight {
  if (value === 1) {
    return FontWeight.Lighter
  } else if (value === 2) {
    return FontWeight.Normal
  } else if (value === 3) {
    return FontWeight.Medium
  } else if (value === 4) {
    return FontWeight.Bold
  } else if (value === 5) {
    return FontWeight.Bolder
  }
}

export function weightToValue(value: FontWeight): number {
  if (value === FontWeight.Lighter) {
    return 1
  } else if (value === FontWeight.Normal) {
    return 2
  } else if (value === FontWeight.Medium) {
    return 3
  } else if (value === FontWeight.Bold) {
    return 4
  } else if (value === FontWeight.Bolder) {
    return 5
  }
}