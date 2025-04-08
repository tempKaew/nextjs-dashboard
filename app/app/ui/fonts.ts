import { Bai_Jamjuree } from "next/font/google";

export const fontBai = Bai_Jamjuree({
  variable: "--font-bai",
  subsets: ["thai", "latin"],
  weight: ["400", "700"],
  display: "swap",
  fallback: ["Helvetica", "sans-serif"],
});
