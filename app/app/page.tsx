import { Button } from "@/components/ui/button";
import Image from "next/image";

export default function Home() {
  return (
    <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-bai">
      <main>
        <h1 className="mb-4 font-bold text-4xl text-blue-400">
          Hello Dashboard
        </h1>
        <Image
          src="/next.svg"
          alt="Next.js logo"
          width={180}
          height={38}
          priority
          className="mb-4"
        />
        <Button>Click Me</Button>
      </main>
    </div>
  );
}
