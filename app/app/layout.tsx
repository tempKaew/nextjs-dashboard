import type { Metadata } from "next";
import "@/app/ui/globals.css";
import { fontBai } from "@/app/ui/fonts";

export const metadata: Metadata = {
  title: "Start Dashboard",
  description: "Start Dashboard",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${fontBai.variable} antialiased`}>{children}</body>
    </html>
  );
}
